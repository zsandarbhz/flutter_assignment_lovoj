import 'package:flutter/material.dart';
import 'package:flutter_assignment_lovoj/utils/common_functions.dart';
import 'package:flutter_assignment_lovoj/utils/dimensions.dart';
import 'package:flutter_assignment_lovoj/utils/text_style_utils.dart';
import 'package:flutter_assignment_lovoj/view/commonWidget/buttons/primaryButton.dart';

import '../../../app/data/global_data_store.dart';
import '../../../app/routes/paths.dart';


class DashboardBody extends StatefulWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  bool showLoader = false;


  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.globalHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${GlobalDataStore.userData!.name}",style: TextStyleUtils.completeDeliveryCount,),
              const SizedBox(height:50 ,),
              PrimaryButton(btnName: "Logout", action: _handleLogout)
            ],
          ),
        ),
      ),
    );
  }

  _handleLogout() {
    CommonFunctions.clearPreferences();
    CommonFunctions.clearUserData();
    Navigator.pushReplacementNamed(context, Paths.loginRoute);
  }

}



