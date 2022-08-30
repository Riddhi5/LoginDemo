import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_demo/app/modules/widget/app_button.dart';
import 'package:login_demo/app/utils/app_colors.dart';
import '../widget/app_textfield.dart';
import '../widget/formfield_validation.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController>{
  LoginView({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginFormKey = GlobalKey<FormState>();
    final Validation validation = Validation();
    return GetBuilder<LoginController>(
      init: LoginController(),
        builder: (loginController){
          return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      const Image(
                        image: AssetImage("assets/images/Login_logo.png"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: const TextSpan(
                            text: "Don’t have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.TEXT_COLOR),
                            children: [
                              TextSpan(
                                text: " Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.PRIMARY_COLOR),
                              )
                            ]
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppTextField(
                        keyboardType: TextInputType.emailAddress,
                        textController: emailController,
                        inputAction: TextInputAction.next,
                        labelText: 'MobileNumber/Email',
                        hintText: 'MobileNumber/Email',
                        validator: validation.validation,
                      ),
                      Obx(() =>
                          AppTextField(
                            keyboardType: TextInputType.text,
                            textController: passwordController,
                            inputAction: TextInputAction.next,
                            labelText: 'Password',
                            hintText: 'Password',
                            isObscure: loginController.hidePassword.value,
                            postIconBtn: IconButton(
                              icon: loginController.hidePassword.value
                                  ? const Icon(
                                Icons.visibility_off_outlined,
                                color: AppColors.ICON_COLOR,
                              )
                                  : const Icon(
                                Icons.visibility_outlined,
                                color: AppColors.ICON_COLOR,
                              ),
                              onPressed: () {
                                loginController.hidePassword.value =
                                !loginController.hidePassword.value;
                              },
                            ),
                            validator: validation.passValidation,
                          ),),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "forgot password/username?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.PRIMARY_COLOR),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(loginFormKey.currentState!.validate()){
                            if(emailController.text.isEmail){
                              print(emailController.text.isEmail);
                              loginController.login(
                                  "",
                                  emailController.text,
                                  passwordController.text);
                            }else{
                              loginController.login(
                                  emailController.text,
                                  "",
                                  passwordController.text);
                            }
                          }
                        },
                        child: const AppSolidButton(
                            text: "SIGN IN"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}