import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/router/router.gr.dart';
import '../../models/field.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({
    super.key,
    required this.field,
  });

  final Field field;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    AutoRouter.of(context);
    return SizedBox(
      width: 245.w,
      height: 350.h,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              field.image,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 15.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        field.name,
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Text(field.type, style: theme.textTheme.bodyMedium),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: theme.colorScheme.outline,
                        size: 14.h,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        field.availability[0].date
                            .toLocal()
                            .toString()
                            .substring(0, 10),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
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
                  SizedBox(height: 28.h),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.router.push(
                          FieldBookingScreenRoute(field: field),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 6.h,
                          horizontal: 40.w,
                        ),
                      ),
                      child: const Text('Reservar'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
