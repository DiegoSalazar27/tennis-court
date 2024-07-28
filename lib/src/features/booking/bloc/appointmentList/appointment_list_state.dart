part of 'appointment_list_bloc.dart';

class AppointmentListState extends Equatable {
  const AppointmentListState({
    required this.appointments,
  });
  final List<Appointment> appointments;

  AppointmentListState.initial() : this(appointments: []);

  const AppointmentListState.changed({
    required this.appointments,
  });

  @override
  List<Object> get props => [appointments];
}
