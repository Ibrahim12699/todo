import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/src/core/resources/assets_manager.dart';
import 'package:todo/src/core/resources/route_manager.dart';
import 'package:todo/src/core/resources/style_manager.dart';
import 'package:todo/src/core/widgets/default_button.dart';

class ExceptionPageError extends StatefulWidget {
  const ExceptionPageError({super.key});

  @override
  State<ExceptionPageError> createState() => _ExceptionPageErrorState();
}

class _ExceptionPageErrorState extends State<ExceptionPageError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MediaQuery.of(context).padding.top.verticalSpace,
          _buildLogo(),
          16.verticalSpace,
          _buildMessage(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      width: 0.3.sw,
      height: 0.3.sw,
      child: SvgPicture.asset(AssetsManager.logo),
    );
  }

  Widget _buildMessage() {
    return Text(S.current.anErrorOccurred, style: getRegularStyle());
  }

  Widget _buildTryAgainButton() {
    return DefaultButton(
      title: S.current.tryAgain,
      width: 0.8.sw,
      onPressed: () {
        context.go(Routes.authRoute);
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [32.verticalSpace, _buildTryAgainButton(), 32.verticalSpace],
    );
  }
}
