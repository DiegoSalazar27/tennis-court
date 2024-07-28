import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../authentication/bloc/auth_bloc/auth_bloc.dart';
import '../../models/field.dart';

class FavoritesButton extends StatelessWidget {
  const FavoritesButton({
    super.key,
    required this.field,
  });

  final Field field;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.currentUser.favorites.contains(field.id)) {
          return IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(AuthUserRemoveFavorites(field.id));
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30.w,
            ),
          );
        }
        return IconButton(
          onPressed: () {
            context.read<AuthBloc>().add(AuthUserAddFavorites(field.id));
          },
          icon: Icon(
            Icons.favorite_border_outlined,
            color: theme.colorScheme.onPrimary,
            size: 30.w,
          ),
        );
      },
    );
  }
}
