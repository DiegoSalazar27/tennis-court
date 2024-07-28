import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/light.dart';
import '../../models/field.dart';

class FieldInfo extends StatelessWidget {
  const FieldInfo({
    super.key,
    required this.field,
  });

  final Field field;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: kPagePadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                field.name,
                style: theme.textTheme.titleLarge,
              ),
              Text(
                "\$ ${field.hourlyRate}",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              field.type,
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              "Por hora",
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.colorScheme.outline),
            ),
          ]),
          SizedBox(height: 12.h),
          Row(
            children: [
              Text(
                field.availability[0].nOfAppointments < 3
                    ? 'Disponible'
                    : 'No Disponible',
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(width: 6.w),
              Container(
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: field.availability[0].nOfAppointments < 3
                      ? theme.colorScheme.secondary
                      : Colors.red,
                ),
              ),
              SizedBox(width: 6.w),
              Icon(
                Icons.watch_later_outlined,
                color: theme.colorScheme.outline,
                size: 14.h,
              ),
              SizedBox(width: 6.w),
              Text(
                "${field.availability[0].from.hour.toString().padLeft(2, '0')}:${field.availability[0].from.minute.toString().padLeft(2, '0')}",
                style: theme.textTheme.bodyMedium,
              ),
              const Text(' a '),
              Text(
                "${field.availability[0].to.hour.toString().padLeft(2, '0')}:${field.availability[0].to.minute.toString().padLeft(2, '0')}",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: theme.colorScheme.outline,
              ),
              Text(
                field.address,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
