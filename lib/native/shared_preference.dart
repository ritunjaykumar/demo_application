import 'package:demo_application/application/initializer.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SharedPreferenceStorage {
  final SharedPreferences sharedPreferences;
  final String _tempKey = 'temp';
  final String _categoryKey = 'category';

  SharedPreferenceStorage(this.sharedPreferences);

  void saveTemperature(String temp) {
    sharedPreferences.setString(_tempKey, temp);
    logger.i('saved temperature');
  }

  String get temperature => sharedPreferences.getString(_tempKey) ?? 'metric';

  void saveCategory(String? category) {
    if (category == null) {
      sharedPreferences.remove(_categoryKey);
      return;
    }
    sharedPreferences.setString(_categoryKey, category);
    logger.i('saved category');
  }

  String? get category => sharedPreferences.getString(_categoryKey);
}
