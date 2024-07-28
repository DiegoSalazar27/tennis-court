part of 'fields_bloc.dart';

class FieldsEvent {
  const FieldsEvent();
}

class FieldChanged extends FieldsEvent {
  const FieldChanged(this.field);
  final Field field;
}
