import 'package:ctrans/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends GetResponsiveView<HomeController> {
  @override
  Widget? desktop() {
    return HomePagePc();
  }

  @override
  Widget? builder() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(screen.context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('CTrans'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Get.toNamed(CRoutes.SETTING);
                },
              ),
            ],
          ),
        ),
        body: Obx(
          () => Column(
            children: [
              Expanded(
                child: TextField(
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  onChanged: (text) {
                    controller.chinese = text;
                  },
                ),
              ),
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(controller.chinese),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePagePc extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.red,
                        contentPadding: const EdgeInsets.all(16),
                      ),
                      onChanged: (text) {
                        controller.chinese = text;
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(controller.chinese),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeController extends GetxController {
  final _box = Hive.openBox('vietphrase');
  final _chinese = ''.obs;

  set chinese(String text) {
    _chinese.value = text;
  }

  String get chinese => _chinese.value;

  @override
  void onReady() {
    super.onReady();
  }
}

class HomeBinds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
