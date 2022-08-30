import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_demo/app/constants/language_constant.dart';
import 'package:login_demo/app/constants/app_images.dart';
import 'package:login_demo/app/modules/widget/app_button.dart';
import 'package:login_demo/app/constants/app_colors.dart';
import '../widget/app_textfield.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginFormKey = GlobalKey<FormState>();
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (loginController) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
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
                      Image(
                        image: AssetImage(AppImages.loginLogo),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        LanguageConst.signIn,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: AppColors.blackColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            text: LanguageConst.account,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.textColor),
                            children: [
                              TextSpan(
                                text: LanguageConst.signUp,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.primaryColor),
                              )
                            ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppTextField(
                        keyboardType: TextInputType.emailAddress,
                        textController: loginController.emailController,
                        inputAction: TextInputAction.next,
                        labelText: LanguageConst.email,
                        hintText: LanguageConst.email,
                        validator: loginController.validation.validation,
                      ),
                      Obx(
                        () => Column(
                          children: [
                            AppTextField(
                              keyboardType: TextInputType.text,
                              textController:
                                  loginController.passwordController,
                              inputAction: TextInputAction.next,
                              labelText: LanguageConst.password,
                              hintText: LanguageConst.password,
                              isObscure: loginController.hidePassword.value,
                              postIconBtn: IconButton(
                                icon: loginController.hidePassword.value
                                    ? const Icon(
                                        Icons.visibility_off_outlined,
                                        color: AppColors.iconColor,
                                      )
                                    : const Icon(
                                        Icons.visibility_outlined,
                                        color: AppColors.iconColor,
                                      ),
                                onPressed: () {
                                  loginController.hidePassword.value =
                                      !loginController.hidePassword.value;
                                },
                              ),
                              validator:
                                  loginController.validation.passValidation,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        LanguageConst.forgotPassword,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.primaryColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (loginFormKey.currentState!.validate()) {
                            loginController.login();
                          }
                        },
                        child: AppSolidButton(text: LanguageConst.signIn),
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
