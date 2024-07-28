import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWithVerticalLine extends StatelessWidget {
  const IconWithVerticalLine({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 10.w),
        Icon(
          icon,
        ),
        SizedBox(width: 5.w),
        Container(
          color: theme.colorScheme.outline,
          width: 1.w,
          height: 20.h,
        ),
      ],
    );
  }
}
