import 'package:hive/hive.dart';

part 'vietphrase.g.dart';

@HiveType(typeId: 1)
class Vietphrase {
  @HiveField(0)
  String chinese;
  @HiveField(1)
  String vietnamese;

  Vietphrase({required this.chinese, required this.vietnamese});

  factory Vietphrase.fromJson(json) => Vietphrase(
        chinese: json['chinese'],
        vietnamese: json['vietnamese'],
      );

  toJson() => {chinese: chinese, vietnamese: vietnamese};
}
