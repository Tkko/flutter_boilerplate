import 'package:flutter_boilerplate/app/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxes {
  const HiveBoxes._();

  static const app = 'app';
  static const localization = 'localization';
}

class HiveKeys {
  const HiveKeys._();

  static const locale = 'locale';
  static const translations = 'translations';
}

class LocalStorage {
  final HiveInterface _hive;

  const LocalStorage(this._hive);

  Future<Either<Failure, bool>> init() async {
    await _hive.initFlutter();
    await _openBoxes();
    return const Right(true);
  }

  Future<void> _openBoxes() async {
    await _hive.openBox(HiveBoxes.app);
  }

  Future<Box> open(String box) async {
    return _hive.openBox(box);
  }
}
