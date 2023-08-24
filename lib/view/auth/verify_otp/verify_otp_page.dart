import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import 'component/verify_otp_body.dart';

class VerifyOtpPage extends StatelessWidget {
  final Map data;
  const VerifyOtpPage({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: _appBar(context),
      body: VerifyOtpBody(data),
    );
  }


  _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorPalettes.transparent,
      elevation: 0,
      leading: ClipRRect(
        child: Material(
          color: ColorPalettes.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                ImageResource.getImagePath('ic_back.svg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
