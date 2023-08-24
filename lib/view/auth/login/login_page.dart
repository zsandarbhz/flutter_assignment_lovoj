import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import 'component/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorPalettes.white,
          child: Stack(
            children: [
              Image.asset(ImageResource.getImagePath('bg.png') ,height: double.infinity,width: double.infinity,fit: BoxFit.fill,),
              const LoginBody()
            ],
          ),
        ),
      ),
    );
  }
}
