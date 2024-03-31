import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/utility/app_colores.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  String validator;
  Function()? onSuffix;
  void Function(String)? onSubmit;
  IconData iconPrefix;
  IconData? iconSuffix;
  TextInputType? textInputType;
  bool? isPassword;

  CustomTextFormField({super.key,
    required this.controller,
    required this.hint,
    required this.validator,
    this.onSuffix,
    this.onSubmit,
    this.textInputType,
    required this.iconPrefix,
    this.iconSuffix,
    this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        keyboardType:textInputType,
        obscureText: isPassword ?? false,
        onFieldSubmitted: onSubmit,
        validator: (value) {
          if (value == null || value
              .trim()
              .isEmpty) {
            return validator;
          } else {
            return null;
          }
        },
        style: Theme
            .of(context)
            .textTheme
            .headlineMedium,
        cursorColor: Theme
            .of(context)
            .cardColor,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide.none,
          ),
          suffixIcon: InkWell(
            onTap: onSuffix,
            child: Icon(iconSuffix ?? null),
          ),
          filled: true,
          fillColor: AppColors.thirdTextColor,
          hintText: hint,
          prefixIcon: Icon(iconPrefix),
        ),
      ),
    );
  }
}
