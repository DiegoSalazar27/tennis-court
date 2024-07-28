import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tennis_court/src/features/booking/bloc/fields/fields_bloc.dart';

import '../../../../core/theme/light.dart';
import '../../../authentication/bloc/auth_bloc/auth_bloc.dart';
import '../widgets/field_card.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) => Padding(
            padding: kPagePadding.copyWith(top: 12.h, bottom: 10.h),
            child: Text(
              "Hola ${state.currentUser.name}!",
              style: theme.textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Divider(color: theme.colorScheme.outline),
        Padding(
          padding: kPagePadding.copyWith(top: 21.h, bottom: 16.h),
          child: Text(
            "Canchas",
            style: theme.textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 360.h,
          child: BlocBuilder<FieldsBloc, FieldsState>(
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.fields.length,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                separatorBuilder: (context, index) => SizedBox(width: 20.h),
                itemBuilder: (BuildContext context, int index) {
                  final item = state.fields[index];

                  return FieldCard(field: item);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
