import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/src/features/booking/bloc/fields/fields_bloc.dart';

import '../../features/booking/bloc/appointmentList/appointment_list_bloc.dart';
import '../dependency_injection/injection_container.dart';

@RoutePage()
class AuthenticatedPage extends StatelessWidget {
  const AuthenticatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FieldsBloc>(
          create: (context) => sl<FieldsBloc>(),
        ),
        BlocProvider<AppointmentListBloc>(
          create: (context) => sl<AppointmentListBloc>(),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
