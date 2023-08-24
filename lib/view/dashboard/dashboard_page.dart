import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/text_style_utils.dart';
import 'comonents/dashboard_body.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: const DashboardBody(),
      appBar: _appBar(context),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      title: Text('dashboard'.tr(),style: TextStyleUtils.btnText,),
      backgroundColor: ColorPalettes.colorPrimary,
    );
  }


}




