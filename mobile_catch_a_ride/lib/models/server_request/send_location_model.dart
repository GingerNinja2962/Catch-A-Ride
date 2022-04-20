import 'package:http/http.dart' as http;

class SendLocation {
  static final Uri _API_PING_URL = Uri.parse('http://10.0.2.2:2962/ping');
  static final Uri _API_PASSENGER_URL = Uri.parse('http://10.0.2.2:2962/'
      'passenger/location');
  static final Uri _API_DRIVER_URL = Uri.parse('http://10.0.2.2:2962/'
      'driver/location');

  SendPassengerLocation() async {
    if (!await _ping_api()) {
      return;
    }
    var response = await http.get(_API_PING_URL);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  SendDriverLocation() async {
    if (!await _ping_api()) {
      return;
    }
    var response = await http.get(_API_PING_URL);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  Future<bool> _ping_api() async {
    http.Response response;
    try {
      response = await http.get(_API_PING_URL);
    } on Exception {
      print("There was an error.");
      return false;
    }
    return (response.statusCode == 200);
  }
}
