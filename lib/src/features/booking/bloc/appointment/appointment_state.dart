part of 'appointment_bloc.dart';

class AppointmentState extends Equatable {
  const AppointmentState({
    required this.currentAppointment,
  });
  final Appointment currentAppointment;

  AppointmentState.initial({
    required int fieldId,
    required int userId,
  }) : this(
          currentAppointment: Appointment(
            fieldId: fieldId,
            userId: userId,
            instructorName: "",
            startTime: const TimeOfDay(hour: 0, minute: 0),
            endTime: const TimeOfDay(hour: 1, minute: 0),
            id: 0,
            additionalInfo: "",
            price: 0.0,
            date: DateTime.now(),
          ),
        );

  const AppointmentState.changed({
    required this.currentAppointment,
  });

  @override
  List<Object> get props => [currentAppointment];
}
