import 'package:ctrans/data/models/vietphrase.dart';
import 'package:ctrans/presentation/pages/splash_page.dart';
import 'package:ctrans/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Vietphrase>(VietphraseAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CTrans',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: CRoutes.INITIAL_ROUTE,
      getPages: pages,
    );
  }
}

class AppBinds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
  }
}
