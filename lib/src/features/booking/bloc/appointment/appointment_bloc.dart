import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/appointment.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final int fieldId;
  final int userId;

  AppointmentBloc({
    required this.fieldId,
    required this.userId,
  }) : super(AppointmentState.initial(fieldId: fieldId, userId: userId)) {
    on<AppointmentDateChanged>(
      (event, emit) {
        emit(AppointmentState.changed(
          currentAppointment: state.currentAppointment.copyWith(
            date: event.date,
          ),
        ));
      },
    );

    on<AppointmentInitialTimeChanged>(
      (event, emit) {
        emit(AppointmentState.changed(
          currentAppointment: state.currentAppointment.copyWith(
            startTime: event.time,
          ),
        ));
      },
    );

    on<AppointmentEndTimeChanged>(
      (event, emit) {
        emit(AppointmentState.changed(
          currentAppointment: state.currentAppointment.copyWith(
            endTime: event.time,
          ),
        ));
      },
    );

    on<AppointmentInstructorChanged>((event, emit) {
      emit(AppointmentState.changed(
        currentAppointment: state.currentAppointment.copyWith(
          instructorName: event.instructorName,
        ),
      ));
    });

    on<AppointmentAdditionalInfoChanged>((event, emit) {
      emit(AppointmentState.changed(
        currentAppointment: state.currentAppointment.copyWith(
          additionalInfo: event.additionalInfo,
        ),
      ));
    });

    on<CurrentAppointmentChanged>((event, emit) {
      emit(AppointmentState.changed(
        currentAppointment: event.appointment,
      ));
    });
  }
}
