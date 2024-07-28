import 'package:get_it/get_it.dart';
import 'package:tennis_court/src/features/authentication/bloc/auth_bloc/auth_bloc.dart';
import 'package:tennis_court/src/features/authentication/bloc/signup_cubit/signup_cubit.dart';
import 'package:tennis_court/src/features/booking/bloc/appointmentList/appointment_list_bloc.dart';

import '../../features/authentication/bloc/login_cubit/login_cubit.dart';
// import '../../features/authentication/services/auth_service.dart';
import '../../features/booking/bloc/appointment/appointment_bloc.dart';
import '../../features/booking/bloc/fields/fields_bloc.dart';
import '../router/auth_guard.dart';
import '../router/router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ! Login

  // Bloc
  sl.registerFactory(
    () => LoginCubit(
        // sl(),
        ),
  );
  sl.registerFactory(
    () => SignUpCubit(),
  );
  sl.registerLazySingleton(
    () => AuthBloc(),
  );

  // ! Fields
  sl.registerFactory(
    () => FieldsBloc(),
  );
  sl.registerFactoryParam(
    (int param1, int param2) =>
        AppointmentBloc(fieldId: param1, userId: param2),
  );
  sl.registerFactory(
    () => AppointmentListBloc(),
  );

  // Data sources
  sl.registerLazySingleton(() => AuthGuard(sl()));
  sl.registerLazySingleton(() => AppRouter());
}
