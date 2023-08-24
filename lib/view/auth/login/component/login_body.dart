// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_lovoj/utils/common_functions.dart';
import 'package:flutter_assignment_lovoj/view/commonWidget/custom_test_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../app/routes/paths.dart';
import '../../../../core/bloc/auth/login/index.dart';
import '../../../../utils/app_toast.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text_style_utils.dart';
import '../../../commonWidget/buttons/primaryButton.dart';
import '../../../commonWidget/loadErrorView.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userTypeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String userType = "admin";
  String? errorMessage;
  bool isShowLoader = false;
  var items = [
    'admin',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.globalHorizontalPadding),
        child: BlocConsumer<LoginBloc,LoginState>(
          listener: (context, state) {
            if(state is LoginSuccess){
              Navigator.pushNamed(context, Paths.dashBoardRoute);
            }
            if(state is LoginFailure){
              AppToast.showError(state.error);
            }
          },
          builder: (context, state) {
            if(state is LoginLoading){
              isShowLoader = true;
            }
            if(state is LoginFailure){
              isShowLoader = false;
            }
            if(state is LoginSuccess){
              isShowLoader = false;
            }
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: 20,),
                        Center(
                          child: Image.asset(
                            ImageResource.getImagePath('logo.png',),
                            width: width*0.6,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(Dimensions.globalHorizontalPadding),
                          decoration: BoxDecoration(
                            color: ColorPalettes.white,
                            borderRadius: const BorderRadius.all(Radius.circular(Dimensions.SIZE_20)),
                            border: Border.all(color: ColorPalettes.borderColor,width: Dimensions.SIZE_2)
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 20,),
                              AutoSizeText('designer'.tr(), style: TextStyleUtils.mainHeadingSignUP,),
                              const SizedBox(height: 5,),
                              AutoSizeText('welcome_back'.tr(), style: TextStyleUtils.subHeadingSignUP,),
                              const SizedBox(height: 20,),
                              Container(
                                width: double.infinity,
                                height: 54,
                                decoration: BoxDecoration(
                                    color: ColorPalettes.white,
                                    borderRadius: BorderRadius.circular(Dimensions.SIZE_10),
                                    border: Border.all(color: ColorPalettes.testFieldBorderColor,width: Dimensions.SIZE_1)
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: userType,
                                    icon: Padding(
                                      padding:  const EdgeInsets.all(Dimensions.SIZE_15),
                                      child: SvgPicture.asset(ImageResource.getImagePath("drop_arrow.svg")),
                                    ),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                          value: items,
                                          child: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.globalHorizontalPadding),
                                          child: Text(items.toString(),
                                            style: TextStyleUtils.black_14_400,),)
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      userType = value!;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24,),
                              CustomTextField(
                                textHint: 'enter_your_email'.tr(),
                                textEditingController: emailController,
                                textInputType: TextInputType.emailAddress,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(Dimensions.SIZE_15),
                                  child: SvgPicture.asset(ImageResource.getImagePath('ic_mail.svg')),
                                ),
                              ),
                              const SizedBox(height: 24,),
                              CustomTextField(
                                textHint: 'password'.tr(),
                                textEditingController: passwordController,
                                textInputType: TextInputType.visiblePassword,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(Dimensions.SIZE_15),
                                  child: SvgPicture.asset(ImageResource.getImagePath('ic_eye_open.svg')),
                                ),
                                onChanged: (value) {
                                  if(value.length>6){

                                  }
                                },
                              ),
                              LoadErrorView(errorMessage),
                              const SizedBox(height: 16,),
                              Row(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  Material(
                                    color: ColorPalettes.transparent,
                                    child: InkWell(
                                      onTap: (){
                                        AppToast.showError("Coming Soon");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AutoSizeText(
                                          'forget_password'.tr(),
                                          style: TextStyleUtils.pink_12_400,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 16,),
                              PrimaryButton(
                                  btnName: 'sign_in'.tr(),
                                  action: _handleSignIn
                              ),
                              const SizedBox(height: Dimensions.SIZE_10,),
                              RichText(
                                text: TextSpan(
                                    text: 'dont_have_an_account'.tr(),
                                    style: TextStyleUtils.black_12_400,
                                    children: <TextSpan>[
                                      TextSpan(text: 'sign_up_now'.tr(),
                                          style: TextStyleUtils.pink_12_700,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushNamed(context, Paths.signUpRoute);
                                            }
                                      )
                                    ]
                                ),
                              ),
                              const SizedBox(height: Dimensions.SIZE_20),
                              RichText(
                                text: TextSpan(
                                    text: 'pp_desc'.tr(),
                                    style: TextStyleUtils.black_12_400,
                                    children: <TextSpan>[
                                      TextSpan(text: 'privacy_policy'.tr(),
                                          style: TextStyleUtils.pink_12_700,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              AppToast.showSuccess("Coming Soon");
                                            }
                                      )
                                    ]
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        InkWell(
                          onTap: () {
                            AppToast.showError("Coming Soon..");
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding:  const EdgeInsets.all(Dimensions.SIZE_15),
                                child: SvgPicture.asset(ImageResource.getImagePath("ic_left_arrow.svg")),
                              ),
                              Text('need_help'.tr(), style: TextStyleUtils.black_18_500,)
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
                if(isShowLoader)
                  const Center(child: CircularProgressIndicator(),)
              ],
            );
          },
        ),
      ),
    );
  }

  bool valid() {
    bool valid = true;
    errorMessage = null;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(password.isEmpty){
      errorMessage = "Please Enter your Password";
      valid = false;
    }else if(password.length<6){
      errorMessage = "Password should be at least 6 digits";
      valid = false;
    }else{
    }

    if (email.isEmpty) {
      valid = false;
      errorMessage = "Please Enter your Email";
    } else if(!CommonFunctions.validateEmail(email)){
      valid = false;
      errorMessage = "Invalid Email";
    }else {
    }

    setState(() {});

    return valid;
  }

  _handleSignIn() async {
    if (valid()) {
      var request = {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'role': userType,
        'deviceToken': ""
      };
      context.read<LoginBloc>().add(LoginBtnPressed(request: jsonEncode(request)));
    }else{
      AppToast.showError("invalid");
    }
  }

}

