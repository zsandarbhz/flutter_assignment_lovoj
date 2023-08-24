import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../utils/text_style_utils.dart';


class CustomTextField extends StatelessWidget {
  final String? textHint;
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onChanged;
  final bool isEnabled;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType? textInputType;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final Function? onTapWidget;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CustomTextField({
    Key? key,
    this.textHint,
    this.textEditingController,
    this.onChanged,
    this.textInputType,
    this.textStyle,
    this.focusNode,
    this.maxLength,
    this.textCapitalization,
    this.onTapWidget,
    this.isEnabled = true,
    this.inputFormatters = const [],
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _textFormFieldWidgetNew();
  }

  _textFormFieldWidgetNew(){
   return SizedBox(
     child: Center(
       child: TextFormField(
         controller: textEditingController,
         maxLength: maxLength,
         focusNode: focusNode,
         enabled: isEnabled,
         decoration: InputDecoration(
            fillColor: Colors.transparent,
             hintText: textHint??"",
             hintStyle: TextStyleUtils.grey_14_400,
             enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(Dimensions.SIZE_10),
               borderSide: BorderSide(color: ColorPalettes.testFieldBorderColor)
             ),
             focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(Dimensions.SIZE_10),
                 borderSide: BorderSide(color: ColorPalettes.colorPrimary)
             ),
             counterText: "",
             filled: true,
             suffixIcon: suffixIcon,
             prefixIcon: prefixIcon,
             contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20)
         ),
         onChanged: onChanged,
         style: textStyle ?? TextStyleUtils.black_14_400,
         keyboardType: textInputType ??TextInputType.text,
       ),
     ),
   );
  }

}
