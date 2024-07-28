import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    this.id = 0,
    this.favorites = const [],
  });

  final String email;
  final String password;
  final String name;
  final String phone;
  final int id;
  final List<int> favorites;

  User copyWith({
    String? email,
    String? password,
    String? name,
    String? phone,
    List<int>? favorites,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      favorites: favorites ?? this.favorites,
    );
  }

  toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'favorites': favorites,
      'id': id,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      phone: json['phone'],
      favorites: List<int>.from(json['favorites']),
      id: json['id'],
    );
  }

  static const empty = User(
    email: '',
    password: '',
    name: '',
    phone: '',
    favorites: [],
  );

  @override
  List<Object?> get props => [
        email,
        password,
        name,
        phone,
        favorites,
      ];
}

bool isUserEmpty(User user) {
  return user == User.empty;
}
