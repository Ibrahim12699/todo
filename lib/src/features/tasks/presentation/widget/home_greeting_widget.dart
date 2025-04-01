import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/src/core/resources/app_constants.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/style_manager.dart';

class HomeGreetingWidget extends StatefulWidget {
  const HomeGreetingWidget({super.key});

  @override
  State<HomeGreetingWidget> createState() => _HomeGreetingWidgetState();
}

class _HomeGreetingWidgetState extends State<HomeGreetingWidget> {
  String name = '';

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.r),
      child: _buildTitle(),
    );
  }

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        text: '${S.current.hi}, ',
        style: getRegularStyle(color: Colors.black, fontSize: 15),
        children: [
          TextSpan(
            text: name.split(' ').first,
            style: getSemiBoldStyle(
              color: ColorManager.primaryColor,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: ', ${S.current.whatAreYouPlanningToday}',
            style: getRegularStyle(color: Colors.black, fontSize: 15),
          ),
        ],
      ),
    );
  }

  void _getData() {
    FirebaseFirestore.instance
        .collection('user')
        .doc(AppConstants.uid)
        .get()
        .then((value) {
          name = value.data()?['full_name'] ?? '';
          setState(() {});
        });
  }
}
