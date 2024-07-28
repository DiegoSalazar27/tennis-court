part of 'appointment_list_bloc.dart';

abstract class AppointmentListEvent {
  const AppointmentListEvent();
}

class AddAppointment extends AppointmentListEvent {
  const AddAppointment(this.appointment);
  final Appointment appointment;
}

class RemoveAppointment extends AppointmentListEvent {
  const RemoveAppointment(this.appointment);
  final Appointment appointment;
}
