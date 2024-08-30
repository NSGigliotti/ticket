import 'package:get/get.dart';
import 'package:ticket/core/helpers/binding/movie_biding.dart';
import 'package:ticket/ui/screens/home/home.dart';
import 'package:ticket/ui/screens/login/loginpage.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.login,
      page: () => const Loginpage(),
    ),
   
    GetPage(
      name: PagesRoutes.home,
      page: () => const Home(),
      bindings: [
        MovieBiding(),
      ],
    ),
  ];
}

abstract class PagesRoutes {
  static const String login = '/login';
  static const String home = '/home';
}
