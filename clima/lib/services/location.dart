import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  void getCurrentLocation() async {
    //added async so that this time consuming n unpredictable time function can happen in the background
    Position position;
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      //low accuracy is sufficient to get weather

      this.latitude = position.latitude;
      this.longitude = position.longitude;

      print('latitude : $latitude \nlongitude : $longitude');
      //due to await, position is printed after it is populated with the right value

    } catch (e) {
      print(e);
    }
  }
}
