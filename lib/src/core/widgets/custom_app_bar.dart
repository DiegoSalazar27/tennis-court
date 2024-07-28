import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/light.dart';

AppBar customAppBar(ThemeData theme) {
  return AppBar(
    iconTheme: IconThemeData(
      color: theme.colorScheme.onPrimary,
    ),
    leadingWidth: 150.w,
    leading: Padding(
      padding: EdgeInsets.only(left: 20.0.h, top: 10.h),
      child: Text("Tennis Court",
          style: theme.textTheme.titleLarge!
              .copyWith(color: theme.colorScheme.onPrimary)),
    ),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: appBarLinearGradient,
      ),
    ),
  );
}
