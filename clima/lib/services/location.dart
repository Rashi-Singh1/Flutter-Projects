import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    //added async so that this time consuming n unpredictable time function can happen in the background
    Position position;
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      //low accuracy is sufficient to get weather

      this.latitude = position.latitude;
      this.longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
