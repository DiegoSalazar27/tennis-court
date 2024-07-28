import 'package:flutter/material.dart';
import 'package:tennis_court/src/features/booking/models/appointment.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.appointment});

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text("Appointment Card"),
            ),
          ),
          Text(appointment.startTime.toString()),
        ],
      ),
    );
  }
}
