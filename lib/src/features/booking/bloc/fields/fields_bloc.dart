import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/field.dart';

part 'fields_event.dart';
part 'fields_state.dart';

class FieldsBloc extends HydratedBloc<FieldsEvent, FieldsState> {
  FieldsBloc() : super(FieldsInitial(initialFieldsList)) {
    on<FieldChanged>((event, emit) {
      final newFields = state.fields.map((e) {
        if (e.id == event.field.id) {
          return event.field;
        }
        return e;
      }).toList();

      emit(FieldsChanged(newFields));
    });
  }

  @override
  FieldsState? fromJson(Map<String, dynamic> json) {
    return FieldsChanged(
      (json['fields'] as List).map((e) => Field.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic>? toJson(FieldsState state) {
    return {
      'fields': state.fields.map((e) => e.toJson()).toList(),
    };
  }
}
