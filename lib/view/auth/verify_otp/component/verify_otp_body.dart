import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_lovoj/core/bloc/auth/signup/index.dart';
import 'package:flutter_assignment_lovoj/core/bloc/timer/index.dart';
import 'package:flutter_assignment_lovoj/utils/app_toast.dart';
import 'package:flutter_assignment_lovoj/utils/dimensions.dart';
import 'package:flutter_assignment_lovoj/utils/images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/bloc/auth/check_email/index.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/text_style_utils.dart';

class VerifyOtpBody extends StatefulWidget {
  final Map data;
  const VerifyOtpBody(this.data, {Key? key}) : super(key: key);

  @override
  State<VerifyOtpBody> createState() => _VerifyOtpBodyState();
}

class _VerifyOtpBodyState extends State<VerifyOtpBody> {

  TextEditingController pinPutController = TextEditingController();
  bool isShowLoader = false;
  final int _timerMaxSeconds = 120;
  int _currentSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    CommonFunctions.printLog(widget.data.toString());
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<CheckEmailBloc,CheckEmailState>(
        listener: (context, state) {
          if(state is SendAgainSuccess){
           startTimeout();
          }
          if(state is SendAgainFailure){
            AppToast.showError(state.error);
          }
        },
        builder: (context, state) {
          if(state is SendAgainLoading){
            isShowLoader = true;
          }
          if(state is SendAgainSuccess){
            isShowLoader = false;
          }
          if(state is SendAgainFailure){
            isShowLoader = false;
          }
          return Stack(children: [
            _main(),
            if(isShowLoader)
              const Center(child: CircularProgressIndicator(),)
          ],);
        },
      ),
    );
  }


  _main() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 52,
                    child: SvgPicture.asset(
                      ImageResource.getImagePath('ic_back.svg'),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: Dimensions.SIZE_40),
            SizedBox(width:240,child: Image.asset(ImageResource.getImagePath("chat.png"))),
            const SizedBox(height: 5),
            // _headerTxtStyle('verify_otp'.tr()),
            BlocBuilder<TimerBloc,TimerState>(
              builder: (context, state) {
                if(state is TimerUpdate){
                  return Text(intToString(state.value), style: TextStyleUtils.black_32_700);
                }
                return Text("00:00", style: TextStyleUtils.black_32_700);

              },

            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.SIZE_30),
              child: Text('type_the_verification_code'.tr(),
                textAlign: TextAlign.center,
                style: TextStyleUtils.black70_32_700,),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            _otpView(),
            const SizedBox(height: 50,),
            InkWell(
              onTap: _handleSendAgain,
                child: Text('send_again'.tr(),
                  style: TextStyleUtils.sendAgain,)
            )
          ],
        ),
      ),
    );
  }

  _otpView() {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: TextStyleUtils.pinFilledText,
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalettes.pinDefaultColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: ColorPalettes.colorPrimary),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: ColorPalettes.colorPrimary),
        color: ColorPalettes.colorPrimary,
      ),
    );
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      controller: pinPutController,
      preFilledWidget: Text("0",style: TextStyleUtils.pinDefaultText),
      validator: (s) {
        return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => _handleSubmit(),
    );
  }

  _handleSubmit() {
    if(pinPutController.text.length==4){
      var request = {
        "name": widget.data["name"],
        "email":widget.data["email"],
        "mobileNumber":widget.data["mobile"],
        "otp_key":pinPutController.text.trim(),
        "storeType":"Fabric",
        "password":widget.data["password"],
      };
      CommonFunctions.printLog(request.toString());
      context.read<SignupBloc>().add(SignupBtnPressed(request: request));
    }
  }

  _handleSendAgain() {
    if(!_timer!.isActive){
      var request = {
        'email': widget.data["email"],
      };
      context.read<CheckEmailBloc>().add(SendAgainPress(request: jsonEncode(request)));
    }else{
      AppToast.showError("Please try after 2 min");
    }
   
  }

  String intToString(int sec){
    String time = "";
    int second = 120 - sec;
    time = "${(second ~/ 60).toString().padLeft(2, '0')}:${(second % 60).toString().padLeft(2, '0')}";
    return time;
  }

  startTimeout([int? milliseconds]) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        _timer = timer;
        _currentSeconds = _timer!.tick;
        CommonFunctions.printLog(_currentSeconds.toString());
        context.read<TimerBloc>().add(TimerAdd(value: _currentSeconds));
        if (_timer!.tick >= _timerMaxSeconds) {
          _cancelTimer();
        }
      }
    });
  }

  _cancelTimer() {
    if (_timer == null) return;
    if (_timer!.isActive) {
      _timer!.cancel();
    }
  }
}


