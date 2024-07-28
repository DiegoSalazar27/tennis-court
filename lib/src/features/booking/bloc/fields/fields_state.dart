part of 'fields_bloc.dart';

abstract class FieldsState extends Equatable {
  const FieldsState(this.fields);

  final List<Field> fields;

  @override
  List<Object> get props => [fields];
}

class FieldsInitial extends FieldsState {
  const FieldsInitial(super.fields);
}

class FieldsChanged extends FieldsState {
  const FieldsChanged(super.fields);
}
