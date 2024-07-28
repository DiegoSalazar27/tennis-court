import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tennis_court/src/core/dependency_injection/injection_container.dart';
import 'package:tennis_court/src/core/theme/light.dart';
import 'package:tennis_court/src/features/booking/bloc/appointment/appointment_bloc.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

import '../../../../core/theme/appointment_theme.dart';
import '../../../authentication/bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/appointmentList/appointment_list_bloc.dart';
import '../../models/field.dart';
import '../widgets/favorite_button.dart';
import '../widgets/field_info.dart';

@RoutePage()
class FieldBookingScreen extends StatelessWidget {
  const FieldBookingScreen({super.key, required this.field});

  final Field field;

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    final theme = Theme.of(context);
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) =>
          previous.currentUser.id != previous.currentUser.id,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => sl<AppointmentBloc>(
            param1: field.id,
            param2: state.currentUser.id,
          ),
          child: Scaffold(
            body: ListView(children: [
              Stack(
                children: [
                  SizedBox(
                    height: 300.h,
                    width: double.infinity,
                    child: Image.asset(
                      field.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 20.h,
                    left: 20.w,
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(0),
                      child: IconButton(
                        onPressed: () => context.router.maybePop(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20.h,
                    right: 20.w,
                    child: FavoritesButton(field: field),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              FieldInfo(field: field),
              SizedBox(height: 17.h),
              Container(
                color: theme.colorScheme.surfaceContainerLowest,
                child: const BookingForm(),
              ),
            ]),
          ),
        );
      },
    );
  }
}

class BookingForm extends StatelessWidget {
  const BookingForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: kPagePadding.copyWith(bottom: 20.h),
      child: Theme(
        data: appointmentTheme,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Establecer fecha y hora',
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 20.h),
            const AppointmentDatePicker(),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: AppointmentInitialTimePicker()),
                SizedBox(width: 20.w),
                const Expanded(child: AppointmentEndTimePicker()),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              "Agregar un comentario",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 15.h),
            const CommentAppointmentField(),
            SizedBox(height: 20.h),
            const AddAppointmentButton(),
          ],
        ),
      ),
    );
  }
}

class AppointmentEndTimePicker extends StatelessWidget {
  const AppointmentEndTimePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TimePickerSpinnerPopUp(
      mode: CupertinoDatePickerMode.time,
      initTime: DateTime.now(),
      onChange: (dateTime) {
        context.read<AppointmentBloc>().add(
              AppointmentEndTimeChanged(
                TimeOfDay.fromDateTime(dateTime),
              ),
            );
      },
    );
  }
}

class AppointmentInitialTimePicker extends StatelessWidget {
  const AppointmentInitialTimePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TimePickerSpinnerPopUp(
      mode: CupertinoDatePickerMode.time,
      initTime: DateTime.now(),
      onChange: (dateTime) {
        context.read<AppointmentBloc>().add(
              AppointmentInitialTimeChanged(
                TimeOfDay.fromDateTime(dateTime),
              ),
            );
      },
    );
  }
}

class AddAppointmentButton extends StatelessWidget {
  const AddAppointmentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context.read<AppointmentListBloc>().add(
                  AddAppointment(
                    state.currentAppointment,
                  ),
                );

            context.router.maybePop();
          },
          child: const Text('Reservar'),
        );
      },
    );
  }
}

class CommentAppointmentField extends StatelessWidget {
  const CommentAppointmentField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      buildWhen: (previous, current) =>
          previous.currentAppointment.additionalInfo !=
          current.currentAppointment.additionalInfo,
      builder: (context, state) {
        return TextFormField(
          maxLines: 4,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          onChanged: (value) => context
              .read<AppointmentBloc>()
              .add(AppointmentAdditionalInfoChanged(value)),
        );
      },
    );
  }
}

class AppointmentDatePicker extends StatelessWidget {
  const AppointmentDatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      buildWhen: (previous, current) =>
          previous.currentAppointment.date != current.currentAppointment.date,
      builder: (context, state) {
        return TimePickerSpinnerPopUp(
          mode: CupertinoDatePickerMode.date,
          onChange: (p0) {
            context.read<AppointmentBloc>().add(AppointmentDateChanged(p0));
          },
          paddingHorizontalOverlay: 20,
        );
      },
    );
  }
}
