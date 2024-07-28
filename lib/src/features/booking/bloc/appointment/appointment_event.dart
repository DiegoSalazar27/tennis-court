part of 'appointment_bloc.dart';

abstract class AppointmentEvent {
  const AppointmentEvent();
}

class AppointmentDateChanged extends AppointmentEvent {
  const AppointmentDateChanged(this.date);
  final DateTime date;
}

class AppointmentInitialTimeChanged extends AppointmentEvent {
  const AppointmentInitialTimeChanged(this.time);
  final TimeOfDay time;
}

class AppointmentEndTimeChanged extends AppointmentEvent {
  const AppointmentEndTimeChanged(this.time);
  final TimeOfDay time;
}

class AppointmentInstructorChanged extends AppointmentEvent {
  const AppointmentInstructorChanged(this.instructorName);
  final String instructorName;
}

class AppointmentAdditionalInfoChanged extends AppointmentEvent {
  const AppointmentAdditionalInfoChanged(this.additionalInfo);
  final String additionalInfo;
}

class CurrentAppointmentChanged extends AppointmentEvent {
  const CurrentAppointmentChanged(this.appointment);
  final Appointment appointment;
}
