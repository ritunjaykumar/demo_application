class SettingDetail {
  String temperature;
  String? category;

  SettingDetail({this.temperature = 'metric'});

  String get symbol => temperature == 'metric' ? 'C' : 'F';

  bool reload = false;

  @override
  String toString() {
    return 'SettingDetail{temperature: $temperature, category: $category}';
  }
}
