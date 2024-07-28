import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Field extends Equatable {
  final String name;
  final String address;
  final String type;
  final String image;
  final List<Availability> availability;
  final int id;
  final double hourlyRate;

  const Field({
    required this.id,
    required this.name,
    required this.address,
    required this.type,
    required this.image,
    required this.availability,
    required this.hourlyRate,
  });

  toJson() {
    return {
      'name': name,
      'address': address,
      'type': type,
      'image': image,
      'availability': availability.map((e) => e.toJson()).toList(),
      'id': id,
      'hourlyRate': hourlyRate,
    };
  }

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      type: json['type'],
      image: json['image'],
      availability: (json['availability'] as List)
          .map((e) => Availability.fromJson(e))
          .toList(),
      hourlyRate: json['hourlyRate'],
    );
  }

  @override
  List<Object?> get props => [
        name,
        address,
        type,
        image,
        availability,
        id,
        hourlyRate,
      ];
}

class Availability extends Equatable {
  final TimeOfDay from;
  final TimeOfDay to;
  final DateTime date;
  final int nOfAppointments;
  final List<int> bookedAppointments;

  const Availability({
    required this.bookedAppointments,
    required this.from,
    required this.to,
    required this.date,
    required this.nOfAppointments,
  });

  toJson() {
    return {
      'from': from,
      'to': to,
      'date': date.millisecond,
      'nOfAppointments': nOfAppointments,
      'bookedAppointments': bookedAppointments
    };
  }

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      from: json['from'],
      to: json['to'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date']),
      nOfAppointments: json['nOfAppointments'],
      bookedAppointments: json['bookedAppointments'],
    );
  }

  @override
  List<Object?> get props => [from, to, nOfAppointments, date];
}

final List<Field> initialFieldsList = [
  Field(
    id: 1,
    name: "Epic Box",
    address: "Vía Av. Caracas y Av. P.º Caroni",
    type: "Cancha tipo A",
    image: "assets/images/field-1.png",
    availability: [
      Availability(
        from: const TimeOfDay(hour: 7, minute: 0),
        to: const TimeOfDay(hour: 16, minute: 0),
        nOfAppointments: 1,
        date: DateTime.now(),
        bookedAppointments: const [],
      ),
      Availability(
        from: const TimeOfDay(hour: 7, minute: 0),
        to: const TimeOfDay(hour: 16, minute: 0),
        nOfAppointments: 0,
        date: DateTime.now().add(const Duration(days: 1)),
        bookedAppointments: const [],
      ),
      Availability(
        from: const TimeOfDay(hour: 7, minute: 0),
        to: const TimeOfDay(hour: 16, minute: 0),
        nOfAppointments: 0,
        date: DateTime.now().add(const Duration(days: 2)),
        bookedAppointments: const [],
      )
    ],
    hourlyRate: 25,
  ),
  Field(
    id: 2,
    name: "Rusty Tenis",
    address: "Vía Av. Caracas y Av. P.º Caroni",
    type: "Cancha tipo C",
    image: "assets/images/field-2.png",
    availability: [
      Availability(
        from: const TimeOfDay(hour: 7, minute: 0),
        to: const TimeOfDay(hour: 16, minute: 0),
        nOfAppointments: 1,
        date: DateTime.now(),
        bookedAppointments: const [],
      )
    ],
    hourlyRate: 25,
  ),
  Field(
    id: 3,
    name: "Cancha multiple",
    address: "Vía Av. Caracas y Av. P.º Caroni",
    type: "Cancha tipo B",
    image: "assets/images/field-3.png",
    availability: [
      Availability(
        from: const TimeOfDay(hour: 7, minute: 0),
        to: const TimeOfDay(hour: 16, minute: 0),
        nOfAppointments: 1,
        date: DateTime.now(),
        bookedAppointments: const [],
      )
    ],
    hourlyRate: 25,
  ),
];
