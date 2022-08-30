import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/app/constants/app_colors.dart';


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
    this.onChanged,
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
  final ValueChanged<String>? onChanged;
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
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        decoration: InputDecoration(
          suffixIcon: widget.postIconBtn,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: AppColors.errorColor),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: AppColors.errorColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(
              color: AppColors.iconColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(
              color: AppColors.iconColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: AppColors.textColor,
          ),
          errorStyle: const TextStyle(color: Color(0xFFCC2E36)),
        ),
      ),
    );
  }
}
