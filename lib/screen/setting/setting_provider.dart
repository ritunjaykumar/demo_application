import '../base/base_provider.dart';

class SettingProvider extends BaseProvider {
  SettingProvider(super.context);

  final List<String> categories = [
    'none',
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];

  void onChange(String temperature) {
    if (temperature == settingDetail.temperature) {
      return;
    }
    settingDetail.reload = true;
    settingDetail.temperature = temperature;
    sharedPreferenceStorage.saveTemperature(temperature);
    notifyListeners();
  }

  void onCategoryChange(String? category) {
    if (settingDetail.category == category) {
      return;
    }
    if (category == 'none') {
      sharedPreferenceStorage.saveCategory(null);
      settingDetail.category = null;
    } else {
      sharedPreferenceStorage.saveCategory(settingDetail.category);
      settingDetail.category = category;
    }
    settingDetail.reload = true;

    notifyListeners();
  }
}
