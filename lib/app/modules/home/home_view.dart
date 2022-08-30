import 'package:flutter/material.dart';
import 'package:login_demo/app/constants/language_constant.dart';
import 'package:login_demo/app/constants/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(LanguageConst.homePage),
      ),
      body:  Center(
        child: Text(
          LanguageConst.welcome,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor
          ),
        ),
      ),
    );
  }
}

