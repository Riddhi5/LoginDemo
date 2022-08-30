import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_demo/app/constants/language_constant.dart';
import 'package:login_demo/app/constants/app_images.dart';
import '../../constants/app_colors.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
           const SizedBox(
             height: 150,
           ),
              Container(
                height: MediaQuery.of(context).size.height/2,
                width: double.infinity,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.appLogo),
                    )
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                children: [
                  Text(
                    LanguageConst.brandText,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    LanguageConst.realText,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.whiteColor),
                    textAlign: TextAlign.justify,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
