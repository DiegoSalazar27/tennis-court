import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tennis_court/src/core/theme/light.dart';
import 'package:tennis_court/src/features/authentication/bloc/auth_bloc/auth_bloc.dart';
import 'package:tennis_court/src/features/booking/bloc/appointmentList/appointment_list_bloc.dart';
import 'package:tennis_court/src/features/booking/bloc/fields/fields_bloc.dart';

@RoutePage()
class FieldAppointmentsPage extends StatelessWidget {
  const FieldAppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: kPagePadding.copyWith(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mis Reservas',
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 20.h),
          BlocBuilder<AppointmentListBloc, AppointmentListState>(
            builder: (context, state) {
              if (state.appointments.isEmpty) {
                return const Text('No hay reservas');
              }

              final fields = context.watch<FieldsBloc>().state.fields;
              final user = context.watch<AuthBloc>().state.currentUser;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.appointments.length,
                itemBuilder: (context, index) {
                  final field = fields.firstWhere(
                    (element) =>
                        element.id == state.appointments[index].fieldId,
                  );
                  // state.appointments[index].fieldId

                  return SizedBox(
                    width: 317,
                    height: 152,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              width: 80.w,
                              field.image,
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  field.name,
                                  style: theme.textTheme.titleMedium,
                                ),
                                Text(
                                  field.type,
                                  style: theme.textTheme.bodyMedium,
                                ),
                                // ADD FORMATS
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      color: theme.colorScheme.outline,
                                      size: 14.h,
                                    ),
                                    SizedBox(width: 6.w),
                                    Text(
                                      state.appointments[index].date
                                          .toLocal()
                                          .toString()
                                          .substring(0, 10),
                                    ),
                                  ],
                                ),
                                Text("Reservado por: ${user.name}"),
                                Row(
                                  children: [
                                    Text(
                                      state.appointments[index].startTime
                                          .format(context),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      state.appointments[index].endTime
                                          .format(context),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "\$${field.hourlyRate * (state.appointments[index].endTime.hour - state.appointments[index].startTime.hour)}",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
