import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  VoidCallback? suffixPressed,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
}) =>
    TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        border: OutlineInputBorder(),
      ),
      validator: suffix != null
          ? (value) {
              if (value!.isEmpty) {
                return 'Password must not be empty';
              } else {
                return null;
              }
            }
          : (value) {
              if (value!.isEmpty) {
                return 'email must not be empty';
              } else {
                return null;
              }
            },
    );
