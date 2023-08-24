import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import 'component/sign_up_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorPalettes.white,
          child: Stack(
            children: [
              Image.asset(ImageResource.getImagePath('bg.png') ,height: double.infinity,width: double.infinity,fit: BoxFit.fill,),
              const SignUpBody()
            ],
          ),
        ),
      ),
    );
  }
}
