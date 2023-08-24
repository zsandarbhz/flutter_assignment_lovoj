// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../app/routes/paths.dart';
import '../../../../core/bloc/auth/check_email/index.dart';
import '../../../../utils/app_toast.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text_style_utils.dart';
import '../../../commonWidget/buttons/primaryButton.dart';
import '../../../commonWidget/custom_test_field.dart';
import '../../../commonWidget/loadErrorView.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? errorMessage;
  String? passwordError;
  bool termsAndCondition = false;
  bool isShowLoader = false;
  String countryCode = "+91";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.globalHorizontalPadding),
        child: BlocConsumer<CheckEmailBloc,CheckEmailState>(
          listener: (context, state) {
            if(state is CheckEmailSuccess){
              var jsonData = {
                "name":nameController.text.trim().toString(),
                "email":emailController.text.trim().toString(),
                "mobile":countryCode+mobileController.text.trim().toString(),
                "password":passwordController.text.trim().toString(),
              };
              Navigator.pushNamed(context, Paths.verifyOtpRoute,arguments:jsonData );
            }
            if(state is CheckEmailFailure){
              AppToast.showError(state.error);
            }
          },
          builder: (context, state) {
            if(state is CheckEmailLoading){
              isShowLoader = true;
            }
            if(state is CheckEmailSuccess){
              isShowLoader = false;
            }
            if(state is CheckEmailFailure){
              isShowLoader = false;
            }
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Form(
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
                            width: width*0.7,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(Dimensions.globalHorizontalPadding),
                          decoration: BoxDecoration(
                              color: ColorPalettes.white,
                              borderRadius: const BorderRadius.all(Radius.circular(Dimensions.SIZE_20)),
                              border: Border.all(color: ColorPalettes.borderColor,width: Dimensions.SIZE_2)
                          ),
                          child: _main(),
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
                const Center(child: CircularProgressIndicator())
              ],
            );
          },
        ),
      ),
    );
  }

  _main() {
    return Column(
      children: [
        const SizedBox(height: 20,),
        AutoSizeText('designer'.tr(), style: TextStyleUtils.mainHeadingSignUP,),
        const SizedBox(height: 5,),
        AutoSizeText('welcome_here'.tr(), style: TextStyleUtils.subHeadingSignUP,),
        const SizedBox(height: 20,),
        CustomTextField(
          textHint: 'full_name'.tr(),
          textEditingController: nameController,
        ),
        const SizedBox(height: 24,),
        CustomTextField(
            textHint: 'enter_your_email'.tr(),
            textEditingController: emailController,
            textInputType: TextInputType.emailAddress,
            // suffixIcon: Padding(
            //   padding: const EdgeInsets.all(Dimensions.SIZE_15),
            //   child: SvgPicture.asset(ImageResource.getImagePath('ic_mail.svg')),
            // )
        ),
        const SizedBox(height: 24,),
        CustomTextField(
            textHint: 'mobile_number'.tr(),
            textEditingController: mobileController,
            textInputType: TextInputType.number,
            maxLength: 10,
            prefixIcon: flagWithCountryCode(),
            // suffixIcon: Padding(
            //   padding: const EdgeInsets.all(Dimensions.SIZE_15),
            //   child: Image.asset(ImageResource.getImagePath('mob.png'),height: 15,width: 15,),
            // )
        ),
        const SizedBox(height: 24,),
        CustomTextField(
            textHint: 'password'.tr(),
            textEditingController: passwordController,
            textInputType: TextInputType.visiblePassword,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(Dimensions.SIZE_15),
              child: SvgPicture.asset(ImageResource.getImagePath('ic_eye_open.svg')),
            )
        ),
        const SizedBox(height: 16,),
        LoadErrorView(errorMessage),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            customCheckBox(),
            const SizedBox(width: 8,),
            Text('terms_condition'.tr(),style: TextStyleUtils.black_12_400,)
          ],
        ),
        const SizedBox(height: Dimensions.SIZE_10,),
        PrimaryButton(
            btnName: 'sign_up'.tr(),
            action: _handleSignUp
        ),
        const SizedBox(height: Dimensions.SIZE_10,),
        RichText(
          text: TextSpan(
              text: 'have_an_account'.tr(),
              style: TextStyleUtils.black_12_400,
              children: <TextSpan>[
                TextSpan(text: 'sign_in_now'.tr(),
                    style: TextStyleUtils.pink_12_700,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(context);
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
    );
  }

  bool valid() {
    bool valid = true;
    errorMessage = null;

    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String mobileNo = mobileController.text.trim();
    String password = passwordController.text.trim();

    if(password.isEmpty){
      passwordError = "Please Enter your Password";
      valid = false;
    }else if(password.length<6){
      passwordError = "Password should be at least 6 digits";
      valid = false;
    }

    if (mobileNo.isEmpty ) {
      valid = false;
      errorMessage = "Please Enter your Mobile";
    } else if(mobileNo.length<10){
      valid = false;
      passwordError = "Invalid Mobile Number";
    }

    if (email.isEmpty) {
      valid = false;
      errorMessage = "Please Enter your Email";
    } else if(!CommonFunctions.validateEmail(email)){
      valid = false;
      errorMessage = "Invalid Email";
    }else {
    }

    if(name.isEmpty){
      errorMessage = "Please Enter your Name";
      valid = false;
    }else if(password.length<6){
      passwordError = "Password should be at least 6 digits";
      valid = false;
    }

    setState(() {});

    return valid;
  }

  _handleSignUp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (valid()) {
      if(termsAndCondition){
        var request = {
          'email': emailController.text.trim(),
        };
        context.read<CheckEmailBloc>().add(
            CheckEmailBtnPress(request: jsonEncode(request)));
      }else{
        AppToast.showError("Please accept terms and conditions");
      }
    }
  }

  customCheckBox() {
    return StatefulBuilder(
      builder: (context, StateSetter setState) {
        return GestureDetector(
          onTap: () {
            setState(() {
              termsAndCondition = !termsAndCondition;
            });
          },
          child: Container(
            width: 22.0,
            height: 22.0,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: ColorPalettes.colorPrimary,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: termsAndCondition
                ? Icon(
              Icons.check,
              size: 18.0,
              color: ColorPalettes.colorPrimary,
            )
                : null,
          ),
        );
      },
    );
  }

  flagWithCountryCode() {
    return CountryCodePicker(
      onChanged: (value) {
        countryCode=value.dialCode.toString();
        CommonFunctions.printLog(value.dialCode.toString());
      },
      initialSelection: 'IN',
      favorite: ['+91','IN'],
      showCountryOnly: false,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
    );
  }
  

}
