import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../routes/app_pages.dart';
import '../widget/formfield_validation.dart';

class LoginController extends GetxController {
  RxBool hidePassword = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Validation validation = Validation();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    try {
      var response = await http.post(
        Uri.parse(
          "http://internal-uat.rupiyatech.link/rupiya/v1/login?rupiya_api=jfKeaHiNmdBezUy5FR6pXfOOParDTMcw",
        ),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'mobile_no': emailController.text.isPhoneNumber?emailController.text:"",
          'email': emailController.text.isEmail
              ? emailController.text
              : "",
          'password': passwordController.text
        }),
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
