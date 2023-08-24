import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_lovoj/utils/images.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/text_style_utils.dart';

class LoadErrorView extends StatelessWidget {
  final String? error;
  const LoadErrorView(this.error,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return error != null ? Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset(ImageResource.getImagePath("icon.svg")),
          const SizedBox(width: 4,),
          AutoSizeText(error!, style: TextStyleUtils.black_14_400,)
        ],
      ),
    ):const SizedBox();
  }
}
