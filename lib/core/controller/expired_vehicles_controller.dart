import 'package:get/get.dart';

import '../model/expired_ehicles_model.dart';
import '../service/expired_vehicles_service.dart';

class ExpiredVehiclesController extends GetxController {
  var isLoading = true.obs;
  RxList<ExpiredVehiclesModel> expiredVehiclesList =
      RxList<ExpiredVehiclesModel>([]);

  @override
  void onInit() {
    fetchExpiredVehicles();
    super.onInit();
  }

  void fetchExpiredVehicles() async {
    try {
      isLoading(true);
      var expiredVehicles = await ExpiredVehiclesService.fetchExpiredVehicle();
      expiredVehiclesList.value = expiredVehicles;
    } finally {
      isLoading(false);
    }
  }
}
