
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/data/global_data_store.dart';
import '../core/models/model.dart';
import 'app_constant.dart';
import 'colors.dart';
import 'dimensions.dart';


class CommonFunctions {
  static clearPreferences() async {
    var pref = await SharedPreferences.getInstance();
    bool? isRemember = pref.getBool("prefRememberDetail");

    for (String key in pref.getKeys()) {

      if(isRemember != null && isRemember){
        if (key == "prefRememberDetail"
            || key == "prefRememberEventId"
            || key == "prefRememberEmailId"
            || key == "prefRememberPass") {
          return;
        }
      }

      pref.remove(key);
    }
  }

  static bool validateMobile(String value) {
    String pattern = r"/^([+]\d{2}[ ])?\d{10}$/";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool validateEmail(String value) {
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static saveUserData(UserData data) async {
    if (data == null) return;

    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    sharedUser.setString(AppConstants.prefUserData, data.toJson().toString());
    sharedUser.setString(AppConstants.prefId, data.sId!);
    sharedUser.setString(AppConstants.prefStoreId, data.storeId!);
    sharedUser.setString(AppConstants.prefStoreNumber, data.storeNumber!);
    sharedUser.setString(AppConstants.prefStoreType, data.storeType!);
    sharedUser.setString(AppConstants.prefName, data.name!);
    sharedUser.setString(AppConstants.prefEmail, data.email!);
    sharedUser.setString(AppConstants.prefMobileNumber, data.mobileNumber!);
    sharedUser.setString(AppConstants.prefRole, data.role!);
    sharedUser.setBool(AppConstants.prefPersonalProfileStatus,data.personalProfileStatus!);
    sharedUser.setBool(AppConstants.prefBusinessProfileStatus,data.businessProfileStatus!);
    sharedUser.setBool(AppConstants.prefProfilePhotoStatus,data.profilePhotoStatus!);
    sharedUser.setBool(AppConstants.prefProfileSignatureStatus,data.profileSignatureStatus!);
    sharedUser.setBool(AppConstants.prefProfileFactoryStatus,data.profileFactoryStatus!);
    CommonFunctions.printLog(data.toJson().toString());
    CommonFunctions.printLog(sharedUser.getString(AppConstants.prefUserData).toString());
  }

  static clearUserData() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    sharedUser.remove(AppConstants.prefUserData);
    sharedUser.remove(AppConstants.prefId);
    sharedUser.remove(AppConstants.prefStoreId);
    sharedUser.remove(AppConstants.prefStoreNumber);
    sharedUser.remove(AppConstants.prefStoreType);
    sharedUser.remove(AppConstants.prefName);
    sharedUser.remove(AppConstants.prefEmail);
    sharedUser.remove(AppConstants.prefMobileNumber);
    sharedUser.remove(AppConstants.prefRole);
    sharedUser.remove(AppConstants.prefPersonalProfileStatus);
    sharedUser.remove(AppConstants.prefBusinessProfileStatus);
    sharedUser.remove(AppConstants.prefProfilePhotoStatus);
    sharedUser.remove(AppConstants.prefProfileSignatureStatus);
    sharedUser.remove(AppConstants.prefProfileFactoryStatus);

    GlobalDataStore.clearData();
  }


  static saveDeviceTokenToPreferences(String? token) async {
    if (token == null) return;

    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    sharedUser.setString("prefDeviceToken", token);
  }

  static saveTokenToPreferences(String token) async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    sharedUser.setString("prefBearerToken", token);
  }

  static Duration getDifferenceFromDate({required String fromDate}) {
    var date = DateTime.parse(fromDate);
    var currentDate = DateTime.now();
    return date.difference(currentDate);
  }

  static String getDateFromTime(
      {required String date, String outputFormat = "dd MMM yyyy"}) {
    DateTime parsedDate = DateTime.parse(date);
    var newDate = DateTime.utc(
        parsedDate.year,
        parsedDate.month,
        parsedDate.day,
        parsedDate.hour,
        parsedDate.minute,
        parsedDate.second,
        parsedDate.millisecond);
    DateFormat formatter = DateFormat(outputFormat);
    return formatter.format(newDate.toLocal()).toString();
  }

  static String changeDateFormat(
      {required String date, required String outputDateFormat}) {
    var time = "";
    try {
      DateFormat outputFormat = DateFormat(outputDateFormat);
      final DateTime dateTime = DateTime.parse(date);
      time = outputFormat.format(dateTime);
    } catch (e) {
      printLog(e.toString());
    }
    return time;
  }

  static String milliSecondToFormatDate(
      {required int timestamp,
      required String outputDateFormat,
      int addMonth = 0}) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var time = "";
    try {
      if (addMonth != 0) {
        date = DateTime(date.year, date.month + addMonth, date.day);
      }

      DateFormat outputFormat = DateFormat(outputDateFormat);
      final DateTime dateTime = DateTime.parse(date.toString());
      time = outputFormat.format(dateTime);
    } catch (e) {
      printLog(e.toString());
    }
    return time;
  }

  static String gmtToLocalWithDateFormat(
      {required String date, required String outputDateFormat}) {
    var time = "";

    try {
      DateFormat outputFormat = DateFormat(outputDateFormat);
      final DateTime dateTime = DateTime.parse(date).toLocal();
      time = outputFormat.format(dateTime);
    } catch (e) {
      printLog(e.toString());
    }
    return time;
  }

  static showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 2),
    ));
  }

  static printLog(String msg) {
    if(kDebugMode){
      print(msg);
    }
  }

  static showPopupSingleButton(
      {required BuildContext context,
        String title = "",
        required String msg,
        String okBtnName = "OK",
        bool willPop = false,
        VoidCallback? okClicked,
        VoidCallback? cancelClicked}) {
    showDialog(
        context: context,
        builder: (context) {

          return WillPopScope(
            onWillPop: () async {
              return willPop;
            },
            child: Material(
              color: Colors.transparent,
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color:Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            if (title.isNotEmpty)
                              Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: ColorPalettes.black,
                                  fontSize:20 )
                              )
                            else
                              Container(),
                            const SizedBox(
                              height: 20.0,
                            ),
                            if (msg.isNotEmpty)
                              Text(msg,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: ColorPalettes.black,
                                      fontSize:20 )
                              )
                            else
                              Container(),
                            const SizedBox(
                              height: 17.0,
                            ),
                            const SizedBox(
                              height: 17.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Material(
                                    child: InkWell(
                                      child: Container(
                                        height: 46,
                                        decoration: BoxDecoration(
                                            color: ColorPalettes.colorPrimary,
                                            borderRadius:
                                            BorderRadius.circular(10.0)),
                                        child: Center(
                                          child: Text(okBtnName,
                                              style: TextStyle(color: ColorPalettes.white,
                                                  fontSize:20 )
                                          ),
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.pop(context);
                                        okClicked?.call();
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static showPopup(
      {required BuildContext context,
        String title = "",
        required String msg,
        String okBtnName = "OK",
        bool willPop = false,
        VoidCallback? okClicked,
        VoidCallback? cancelClicked}) {
    showDialog(
        context: context,
        builder: (context) {

          return WillPopScope(
            onWillPop: () async {
              return willPop;
            },
            child: Material(
              color: Colors.transparent,
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color:Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            if (title.isNotEmpty)
                              Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: ColorPalettes.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize:20 )
                              )
                            else
                              Container(),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(msg,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: ColorPalettes.black.withOpacity(.7),
                                    fontWeight: FontWeight.w400,
                                    fontSize:16 )
                            ),
                            const SizedBox(
                              height: 17.0,
                            ),
                            const SizedBox(
                              height: 17.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    child: Container(
                                      height: 46,
                                      decoration: BoxDecoration(
                                          color: ColorPalettes.colorPrimary,
                                          borderRadius:
                                          BorderRadius.circular(10.0)),
                                      child: Center(
                                        child: Text('ok'.tr(), style: TextStyle(color: ColorPalettes.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize:20 )
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.pop(context);
                                      okClicked?.call();
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: InkWell(
                                    child: Container(
                                      height: 46,
                                      decoration: BoxDecoration(
                                          color: ColorPalettes.colorPrimary,
                                          borderRadius:
                                          BorderRadius.circular(10.0)),
                                      child: Center(
                                        child: Text('cancel'.tr(),
                                            style: TextStyle(color: ColorPalettes.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize:20 )
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }


  static showImagePopup(
      {required BuildContext context,
        required String url,
        bool willPop = false,
        VoidCallback? okClicked,
        VoidCallback? cancelClicked}) {
    showDialog(
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              return willPop;
            },
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.globalHorizontalPadding),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.globalHorizontalPadding/2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          Material(
                            color: Colors.white,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: (){
                                    Navigator.pop(context);
                                  },
                                child: SizedBox(
                                    height: 35,
                                    child: Image.asset('assets/icons/ic_cross.png',),
                                  ),
                              ),
                            ),
                          ),
                          Material(
                            child: AspectRatio(
                              aspectRatio: 1/1,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10.0),
                                  // child: CustomNetworkImage(url,)
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
