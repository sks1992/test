import 'package:http/http.dart' as http;

import '../model/expired_ehicles_model.dart';

class ExpiredVehiclesService {
  static var client = http.Client();

  static Future<List<ExpiredVehiclesModel>> fetchExpiredVehicle() async {
    var response = await client.get(Uri.parse(
        'http://globalgps.in:8089/api/v1/Vehicle/ExpiredVehicles/18/2025-12-31'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return expiredVehiclesModelFromJson(jsonString);
    } else {
      return null;
    }
  }
}
