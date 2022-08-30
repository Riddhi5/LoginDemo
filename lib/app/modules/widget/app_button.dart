import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/app/utils/app_colors.dart';

class AppSolidButton extends StatelessWidget {
  const AppSolidButton({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width/1,
        decoration: BoxDecoration(
          color: AppColors.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(6)
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
