import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () async {
              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['txt'],
              );
              if (result != null) {
                controller.vietphrase = result.files.single.path;
              }
            },
            title: Text('Vietphrase'),
            subtitle: Obx(() => Text(controller.vietphrase)),
          ),
        ],
      ),
    );
  }
}

class SettingController extends GetxController {
  final _vietphrase = ''.obs;

  set vietphrase(String? text) => _vietphrase.value = text ?? '';

  String get vietphrase => _vietphrase.value;
}

class SettingBinds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
