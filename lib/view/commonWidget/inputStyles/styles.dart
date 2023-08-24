import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class Styles {
  //For default TextField
  static InputDecoration customInputDecoration(String hintText, {errorMsg}) =>
      InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
          errorText: errorMsg,
          hintText: hintText,
          counterText: '',
          hintStyle: TextStyle(
            color: ColorPalettes.txtColorGrey,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: ColorPalettes.fillColor);

  //For Password
  static InputDecoration customInputPasswordDecoration(String hintText,
          {errorMsg, bool passwordVisible = false, action}) =>
      InputDecoration(
          errorText: errorMsg,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: hintText,
          counterText: '',
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: ColorPalettes.black.withOpacity(.30),
            ),
            onPressed: action,
          ),
          hintStyle: TextStyle(
            color: ColorPalettes.txtColorGrey,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: ColorPalettes.fillColor);

}
