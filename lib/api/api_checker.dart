import 'package:admin_app/common/widgets/custom_snackbar_widget.dart';
import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if(response.statusCode == 401) {
      showCustomSnackBar("authentication failed");
    }else {
      showCustomSnackBar(response.statusText);
    }
  }
}
