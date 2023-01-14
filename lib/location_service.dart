// ignore: import_of_legacy_library_into_null_safe
import 'package:geolocator/geolocator.dart';
import './location_class.dart';

class LocationService {
  static const LocationClass initLocation =
      LocationClass(latitude: 37.611035490773, longitude: 126.99457310622);

  Future<LocationPermission> hasLocationPermission() async =>
      await Geolocator.checkPermission();

  Future<bool> isLocationEnabled() async =>
      await Geolocator.isLocationServiceEnabled();

  Future<LocationPermission> requestLocation() async =>
      await Geolocator.requestPermission();

  Future<LocationClass> currentLocation() async {
    final Position _position = await Geolocator.getCurrentPosition();
    return LocationClass(
        latitude: _position.latitude, longitude: _position.longitude);
  }

  Future<bool> canGetCurrentLocation() async {
    final LocationPermission _permission = await this.hasLocationPermission();
    if (_permission == LocationPermission.always ||
        _permission == LocationPermission.whileInUse) {
      final bool _enabled = await this.isLocationEnabled();
      if (_enabled) return true;
    }
    return false;
  }
}
