import 'package:fl_components/models/menu_option.dart';
import 'package:fl_components/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static final menuOption = <MenuOption>[
    // MenuOption(
    //     route: 'home',
    //     icon: Icons.home_outlined,
    //     nombre: 'Home Screen',
    //     screen: const HomeScreen()),
    MenuOption(
        route: 'Listview1',
        icon: Icons.list_alt_outlined,
        nombre: 'Listview1 tipo 1',
        screen: const Listview1Screen()),
    MenuOption(
        route: 'Listview2',
        icon: Icons.list_alt_outlined,
        nombre: 'Listview2 tipo 2',
        screen: const Listview2Screen()),
    MenuOption(
        route: 'Alert',
        icon: Icons.notification_add_outlined,
        nombre: 'Alertas - Alerts',
        screen: const AlertScreen()),
    MenuOption(
        route: 'Card',
        icon: Icons.payment_outlined,
        nombre: 'Tarjetas - Cads',
        screen: const CardScreen()),
    MenuOption(
        route: 'Avatar',
        icon: Icons.person_outline_outlined,
        nombre: 'Circule Avatar',
        screen: const AvatarScreen()),
    MenuOption(
        route: 'Animeted',
        icon: Icons.animation_outlined,
        nombre: 'Animeted Conteiner',
        screen: const AimetedScreen()),
    MenuOption(
        route: 'Inputs',
        icon: Icons.input,
        nombre: 'Text Inputs',
        screen: const InputsScreen()),
    MenuOption(
        route: 'Slider',
        icon: Icons.slideshow_outlined,
        nombre: 'Slider & Checks',
        screen: const SliderScreen()),
    MenuOption(
        route: 'ListViewBuilder',
        icon: Icons.build_circle_outlined,
        nombre: 'InfiniteScrol & Pull to refresh',
        screen: const ListViewBuilderScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (final options in menuOption) {
      appRoutes
          .addAll({options.route: (BuildContext context) => options.screen});
    }
    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'Listview1': (BuildContext context) => const Listview1Screen(),
  //   'Listview2': (BuildContext context) => const Listview2Screen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'card': (BuildContext context) => const CardScreen()
  // };
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
