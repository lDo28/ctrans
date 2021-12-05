import 'package:ctrans/data/models/vietphrase.dart';
import 'package:ctrans/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashPage extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: CircularProgressIndicator(strokeWidth: 15)),
        ),
      ),
    );
  }
}

class AppController extends GetxController {
  final _path = 'assets/res/VietPhrase.txt';
  late Box<Vietphrase> _box;
  final regex = RegExp(r'(?<chinese>\W+)=(?<vietnamese>[^=].+)');

  _loadData() async {
    final content = await rootBundle.loadString(_path);
    await _save(regex.allMatches(content));
  }

  _save(Iterable<RegExpMatch> matchs) async {
    await Future.forEach<RegExpMatch>(matchs, (match) {
      final chinese = match.namedGroup('chinese') ?? '';
      if (chinese.isNotEmpty && !_box.containsKey(chinese)) {
        final vietnamese = match.namedGroup('vietnamese') ?? '';
        _box.add(Vietphrase(chinese: chinese, vietnamese: vietnamese));
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    Hive.openBox<Vietphrase>('vietphrase').then((box) {
      _box = box;
      _loadData().then((value) {
        print('completed');
        Get.offNamed(CRoutes.HOME);
      });
    });
  }
}
