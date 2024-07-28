import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Appointment extends Equatable {
  final int fieldId;
  final int userId;
  final String? instructorName;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final DateTime date;
  final int id;
  final String? additionalInfo;
  final double price;

  const Appointment({
    required this.fieldId,
    required this.userId,
    required this.instructorName,
    required this.startTime,
    required this.endTime,
    required this.id,
    required this.additionalInfo,
    required this.price,
    required this.date,
  });

  Appointment.empty()
      : fieldId = 0,
        userId = 0,
        instructorName = '',
        startTime = const TimeOfDay(hour: 0, minute: 0),
        endTime = const TimeOfDay(hour: 0, minute: 0),
        id = 0,
        additionalInfo = '',
        price = 0.0,
        date = DateTime.now();

  Appointment copyWith({
    int? fieldId,
    int? userId,
    String? instructorName,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    int? id,
    String? additionalInfo,
    double? price,
    DateTime? date,
  }) {
    return Appointment(
      fieldId: fieldId ?? this.fieldId,
      userId: userId ?? this.userId,
      instructorName: instructorName ?? this.instructorName,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      id: id ?? this.id,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      price: price ?? this.price,
      date: date ?? this.date,
    );
  }

  toJson() {
    return {
      'price': price,
      'fieldId': fieldId,
      'userId': userId,
      'instructorName': instructorName,
      'startTime': "${startTime.hour}:${startTime.minute}",
      'endTime': "${endTime.hour}:${endTime.minute}",
      'id': id,
      'additionalInfo': additionalInfo,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Appointment.fromJson(Map<String, dynamic> json) {
    final startTimeJson = json['startTime'].split(':');
    final endTimeJson = json['endTime'].split(':');
    return Appointment(
      fieldId: json['fieldId'],
      userId: json['userId'],
      instructorName: json['instructorName'],
      startTime: TimeOfDay(
        hour: int.parse(startTimeJson[0]),
        minute: int.parse(startTimeJson[1]),
      ),
      endTime: TimeOfDay(
        hour: int.parse(endTimeJson[0]),
        minute: int.parse(endTimeJson[1]),
      ),
      date: DateTime.fromMillisecondsSinceEpoch(json['date']),
      id: json['id'],
      additionalInfo: json['additionalInfo'],
      price: json['price'],
    );
  }

  @override
  List<Object?> get props => [
        fieldId,
        userId,
        instructorName,
        startTime,
        endTime,
        date,
        id,
        price,
        additionalInfo,
      ];
}
