import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/app/utils/app_colors.dart';


class AppTextField extends StatefulWidget {
  AppTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    required this.inputAction,
    required this.textController,
    this.postIconBtn,
    this.isObscure = false,
    this.onTap,
    this.onEditingComplete,
    required Function(String value) validator,
  }) : _validator = validator,
        super(key: key);
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final String labelText;
  final String hintText;
  final Widget? postIconBtn;
  final TextEditingController textController;
  bool isObscure;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final Function(String) _validator;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: widget.textController,
        obscureText: widget.isObscure,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => widget._validator(value!),
        textInputAction: widget.inputAction,
        keyboardType: widget.keyboardType,
        onTap: widget.onTap,
        onEditingComplete: widget.onEditingComplete,
        decoration: InputDecoration(
          suffixIcon: widget.postIconBtn,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: AppColors.PRIMARY_COLOR),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Colors.red),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(
              color: Colors.yellow,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(
              color: AppColors.ICON_COLOR,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: AppColors.TEXT_COLOR,
          ),
          errorStyle: const TextStyle(color: Color(0xFFCC2E36)),
          helperStyle: const TextStyle(
            color: Color(0xFF2BACE2),
          ),
        ),
      ),
    );
  }
}
