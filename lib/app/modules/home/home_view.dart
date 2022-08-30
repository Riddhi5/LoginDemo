
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/app/utils/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PRIMARY_COLOR,
        title: const Text("HomePage"),
      ),
      body: const Center(
        child: Text(
          "Welcomeee!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}

