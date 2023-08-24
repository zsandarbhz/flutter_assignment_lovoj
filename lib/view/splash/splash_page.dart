
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/data/global_data_store.dart';
import '../../app/routes/paths.dart';
import '../../core/models/model.dart';
import '../../utils/app_constant.dart';
import '../../utils/colors.dart';
import '../../utils/common_functions.dart';
import '../../utils/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorPalettes.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorPalettes.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light),
      ),
      body: SafeArea(
          child: Center(
        child: Image.asset(
          ImageResource.getImagePath('logo.png'),
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width * 0.6,
        ),
      )),
    );
  }

  _initializeServices() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    UserData? data;
    try{
      String? response = perf.getString(AppConstants.prefUserData);
      CommonFunctions.printLog("Response- ${response.toString()}");
      if(response!=null){
        data = UserData(
            sId: perf.getString(AppConstants.prefId),
            storeId: perf.getString(AppConstants.prefStoreId),
            storeType: perf.getString(AppConstants.prefStoreType),
            storeNumber: perf.getString(AppConstants.prefStoreNumber),
            name: perf.getString(AppConstants.prefName),
            email: perf.getString(AppConstants.prefEmail),
            mobileNumber: perf.getString(AppConstants.prefMobileNumber),
            role: perf.getString(AppConstants.prefRole),
            personalProfileStatus: perf.getBool(AppConstants.prefPersonalProfileStatus),
            businessProfileStatus: perf.getBool(AppConstants.prefBusinessProfileStatus),
            profilePhotoStatus: perf.getBool(AppConstants.prefProfilePhotoStatus),
            profileSignatureStatus: perf.getBool(AppConstants.prefProfileSignatureStatus),
            profileFactoryStatus: perf.getBool(AppConstants.prefProfileFactoryStatus));
        GlobalDataStore.userData = data;
        CommonFunctions.printLog(data.toJson().toString());
      }

    }catch(e){
      CommonFunctions.printLog(e.toString());
    }

    Future.delayed(const Duration(seconds: 3), () {
      if(GlobalDataStore.userData != null){
        GlobalDataStore.isLogin = true;
        Navigator.pushReplacementNamed(context, Paths.dashBoardRoute);
      }else{
        Navigator.pushReplacementNamed(context, Paths.loginRoute);
      }

    });
  }
}
