import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  RxBool hidePassword = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login(String mobileNumber,String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse(
          "http://internal-uat.rupiyatech.link/rupiya/v1/login?rupiya_api=jfKeaHiNmdBezUy5FR6pXfOOParDTMcw",
        ),
        headers: <String, String>{"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{
              'mobile_no': mobileNumber,
              'email': email,
              'password': password}),
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: data["msg"].toString());
        Get.offAllNamed(Routes.HOME);
      } else {
        Fluttertoast.showToast(msg: data["msg"].toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
