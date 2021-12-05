import 'package:ctrans/main.dart';
import 'package:ctrans/presentation/pages/home_page.dart';
import 'package:ctrans/presentation/pages/setting_page.dart';
import 'package:ctrans/presentation/pages/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

final pages = <GetPage>[
  GetPage(
    name: CRoutes.SPLASH,
    page: () => SplashPage(),
    binding: AppBinds(),
  ),
  GetPage(
    name: CRoutes.HOME,
    page: () => HomePage(),
    binding: HomeBinds(),
  ),
  GetPage(
    name: CRoutes.SETTING,
    page: () => SettingPage(),
    binding: SettingBinds(),
  ),
];
