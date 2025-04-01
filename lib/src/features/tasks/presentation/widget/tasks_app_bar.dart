import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/src/core/resources/app_constants.dart';
import 'package:todo/src/core/resources/cache_helper.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/route_manager.dart';
import 'package:todo/src/core/resources/style_manager.dart';

class TasksAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TasksAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(50.r);

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(context) {
    return AppBar(
      backgroundColor: ColorManager.white,
      forceMaterialTransparency: true,
      title: _buildAppTitle(),
      centerTitle: true,
      actions: [_buildLogoutIcon(context)],
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildLogoutIcon(context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 8.r),
      child: IconButton(
        onPressed: () => _onLogoutPress(context),
        icon: Icon(Icons.exit_to_app_rounded, color: ColorManager.black),
      ),
    );
  }

  Widget _buildAppTitle() {
    return Text(
      AppConstants.appName,
      style: getSemiBoldStyle(color: ColorManager.black, fontSize: 18),
    );
  }

  void _onLogoutPress(BuildContext context) {
    CacheHelper.removeData(key: AppConstants.uidKey).whenComplete(() {
      RouteGenerator.router.go(Routes.authRoute);
    });
  }
}
