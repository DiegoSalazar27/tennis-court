import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionsListCustomEndDrawer extends StatelessWidget {
  const ActionsListCustomEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EndDrawerLink(text: 'Favoritos', onTap: () async => {}),
        // EndDrawerLink(
        //   text: 'Notificaciones',
        //   onTap: () async {
        //     Scaffold.of(context).closeEndDrawer();
        //     await context.router.push(
        //       const NotificationsPageRoute(),
        //     );
        //   },
        // ),
        // EndDrawerLink(
        //   text: 'Ayuda',
        //   dividerIsVisible: false,
        //   onTap: () async {
        //     Scaffold.of(context).closeEndDrawer();
        //     await context.router.push(
        //       const SupportPageRoute(),
        //     );
        //   },
        // ),
      ],
    );
  }
}

class EndDrawerLink extends StatelessWidget {
  const EndDrawerLink({
    super.key,
    required this.text,
    required this.onTap,
    this.dividerIsVisible = true,
  });

  final Function()? onTap;
  final String text;
  final bool dividerIsVisible;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: theme.textTheme.bodyMedium,
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    height: 12.h,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: theme.colorScheme.primary,
                  size: 13.h,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 1.5,
          color: theme.disabledColor,
        ),
      ],
    );
  }
}
