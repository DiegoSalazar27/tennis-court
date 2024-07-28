import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tennis_court/src/core/router/router.gr.dart';
import 'package:tennis_court/src/core/widgets/custom_app_bar.dart';
import '../widgets/custom_end_drawer/custom_end_drawer.dart';

@RoutePage()
class InitialPage extends StatelessWidget {
  const InitialPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    AutoRouter.of(context);
    return AutoTabsScaffold(
      endDrawer: const CustomEndDrawer(),
      appBarBuilder: (_, tabsRouter) => customAppBar(theme),
      routes: const [
        HomePageRoute(),
        FieldAppointmentsPageRoute(),
        FavoritesFieldsPageRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: (index) {
          tabsRouter.setActiveIndex(index);
        },
        selectedLabelStyle: TextStyle(color: theme.colorScheme.onPrimary),
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.outline,
        unselectedLabelStyle: TextStyle(color: theme.colorScheme.outline),
        items: const [
          BottomNavigationBarItem(
            label: 'Inicio',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Reservas',
            icon: Icon(Icons.calendar_today_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Favoritos',
            icon: Icon(Icons.favorite_outline),
          ),
        ],
      ),
    );
  }
}
