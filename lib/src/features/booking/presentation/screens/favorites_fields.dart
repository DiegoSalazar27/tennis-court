import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tennis_court/src/core/theme/light.dart';
import 'package:tennis_court/src/features/authentication/bloc/auth_bloc/auth_bloc.dart';
import 'package:tennis_court/src/features/booking/presentation/widgets/field_card.dart';

import '../../bloc/fields/fields_bloc.dart';

@RoutePage()
class FavoritesFieldsPage extends StatelessWidget {
  const FavoritesFieldsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: kPagePadding,
          child: Text(
            'Canchas favoritas',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(height: 20.h),
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final fieldsBloc = context.watch<FieldsBloc>();
            final fields = state.currentUser.favorites.map((id) {
              return fieldsBloc.state.fields
                  .firstWhere((element) => element.id == id);
            }).toList();
            return SizedBox(
              height: 380.h,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: fields.length,
                scrollDirection: Axis.horizontal,
                padding: kPagePadding,
                itemBuilder: (itemBuilder, index) {
                  final field = fields[index];
                  return FieldCard(field: field);
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 20.h,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
