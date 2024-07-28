import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/appointment.dart';

part 'appointment_list_event.dart';
part 'appointment_list_state.dart';

class AppointmentListBloc
    extends HydratedBloc<AppointmentListEvent, AppointmentListState> {
  AppointmentListBloc() : super(AppointmentListState.initial()) {
    on<AddAppointment>((event, emit) {
      emit(AppointmentListState.changed(
        appointments: [...state.appointments, event.appointment],
      ));
    });

    on<RemoveAppointment>((event, emit) {
      emit(AppointmentListState.changed(
        appointments: state.appointments
            .where((element) => element.id != event.appointment.id)
            .toList(),
      ));
    });
  }

  @override
  AppointmentListState? fromJson(Map<String, dynamic> json) {
    return AppointmentListState.changed(
      appointments: (json['appointments'] as List)
          .map((e) => Appointment.fromJson(e))
          .toList(),
    );
  }

  @override
  Map<String, dynamic>? toJson(AppointmentListState state) {
    return {
      'appointments': state.appointments.map((e) => e.toJson()).toList(),
    };
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }
}
