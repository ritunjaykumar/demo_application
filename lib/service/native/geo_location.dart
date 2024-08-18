import 'package:demo_application/application/initializer.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocationService {
  Future<Position> getCurrentLocation({bool openSetting = false}) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Please enable location.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      if (openSetting) {
        openLocationSetting();
        return Future.error(
            'Location permissions are permanently denied, Opening location setting.');
      } else {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    }

    return await Geolocator.getCurrentPosition(locationSettings: _locationSetting());
  }

  void openLocationSetting() async {
    var opened = await Geolocator.openLocationSettings();
    logger.i('location opened status: $opened');
  }

  LocationSettings _locationSetting() {
    late LocationSettings locationSettings;
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 10),
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText:
              "App will continue to receive your location even when you aren't using it",
          notificationTitle: "Getting current location",
          enableWakeLock: true,
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        showBackgroundLocationIndicator: true,
      );
    } else {
      throw '$defaultTargetPlatform is not supported';
    }
    return locationSettings;
  }
}
