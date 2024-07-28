import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    AutoRouter.of(context);
    return Stack(
      children: [
        Image.asset(
          'assets/images/field-bubble.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Padding(
          padding: EdgeInsets.only(top: 35.h, left: 30.w),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
            ),
            onPressed: () {
              context.router.maybePop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        )
      ],
    );
  }
}
