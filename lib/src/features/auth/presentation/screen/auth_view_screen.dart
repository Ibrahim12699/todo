import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/src/core/resources/commons.dart';
import 'package:todo/src/features/auth/data/model/auth_type_model.dart';
import 'package:todo/src/core/resources/app_constants.dart';
import 'package:todo/src/core/resources/assets_manager.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/style_manager.dart';
import 'package:todo/src/core/resources/theme/my_colors.dart';
import 'package:todo/src/features/auth/data/repo/auth_repo.dart';
import 'package:todo/src/features/auth/presentation/screen/login_screen.dart';
import 'package:todo/src/features/auth/presentation/screen/register_screen.dart';
import 'package:todo/src/features/auth/presentation/widget/auth_switch_btn.dart';

class AuthViewScreen extends StatefulWidget {
  const AuthViewScreen({super.key});

  @override
  State<AuthViewScreen> createState() => _AuthViewScreenState();
}

class _AuthViewScreenState extends State<AuthViewScreen> {
  AuthTypeModel selectedAuthType = authTypes[0];
  final List<Widget> authPages = [LoginScreen(), RegisterScreen()];
  int _currentPage = 0;

  ValueNotifier<AuthTypeModel> authTypeNotifier = ValueNotifier(authTypes[0]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorManager.liteGrey,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: 1.sh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            Commons.isTablet(context)
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Commons.isTablet(context) ? 0.6.sw : 1.sw,
            child: Column(
              children: [
                Column(
                  children: [
                    _buildTopSpace(),
                    _buildLogo(),
                    24.verticalSpace,
                    _buildAppName(),
                    8.verticalSpace,
                    _buildHintText(),
                  ],
                ),
                _buildCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopSpace() {
    return SizedBox(height: MediaQuery.of(context).padding.top + 40.h);
  }

  Widget _buildLogo() {
    return Container(
      height: 60.r,
      width: 60.r,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SvgPicture.asset(AssetsManager.logo),
    );
  }

  Widget _buildAppName() {
    return Text(AppConstants.appName, style: getBoldStyle(fontSize: 26));
  }

  Widget _buildHintText() {
    return Text(
      S.current.authHint,
      style: getRegularStyle(
        color: Theme.of(context).extension<MyColors>()!.subTextColor,
      ),
    );
  }

  Widget _buildCard() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.all(20.r),
        padding: EdgeInsets.only(left: 20.r, right: 20.r, bottom: 20.r),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: ValueListenableBuilder(
          valueListenable: authTypeNotifier,
          builder: (BuildContext context, AuthTypeModel value, Widget? child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  24.verticalSpace,
                  AuthSwitchBtn(
                    selectedAuthType: value,
                    onItemPressed: _onItemPressed,
                  ),
                  _buildInnerWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onItemPressed(AuthTypeModel model) {
    authTypeNotifier.value = model;

    authTypeNotifier.value.id == 'login' ? _currentPage = 0 : _currentPage = 1;
  }

  Widget _buildInnerWidget() {
    return authPages[_currentPage];
  }
}
