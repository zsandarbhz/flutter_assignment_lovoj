import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_style_utils.dart';

class PrimaryButton extends StatelessWidget {
  final bool isDisable;
  final String btnName;
  final Color txtColor;
  final Color bgColor;
  final double horizontalPadding;
  final double verticalPadding;
  final dynamic action;
  const PrimaryButton(
      {Key? key,
      this.isDisable = false,
      required this.btnName,
      this.txtColor = Colors.white,
      this.bgColor = const Color(0xFFEE03C9),
      this.horizontalPadding = 24,
      this.verticalPadding = 16,
      required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isDisable ? ColorPalettes.btnColoDisable : bgColor,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: isDisable ? null : action,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(btnName,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyleUtils.btnText,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
