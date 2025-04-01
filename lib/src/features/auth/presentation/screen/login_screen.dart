import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/src/core/resources/app_constants.dart';
import 'package:todo/src/core/resources/cache_helper.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/route_manager.dart';
import 'package:todo/src/core/resources/validators.dart';
import 'package:todo/src/core/widgets/custom_text_field_widget.dart';
import 'package:todo/src/core/widgets/default_button.dart';
import 'package:todo/src/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:todo/src/features/auth/presentation/widget/agree_terms_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return _buildConsumer();
  }

  Widget _buildConsumer() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) {
        switch (state) {
          case LoginSuccess(:final uid):
            _onLoginSuccess(uid);
            break;
          case LoginError(:final error):
            _onLoginError(error);
            break;
          case LoginLoading _:
            loading = true;
            break;
          default:
            break;
        }
      },
      builder: (context, state) {
        return _buildBody();
      },
    );
  }

  Widget _buildBody() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          24.verticalSpace,
          _buildEmailField(),
          16.verticalSpace,
          _buildPasswordField(),
          24.verticalSpace,
          _buildLoginButton(),
          24.verticalSpace,
          AgreeTermsWidget(),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextFieldWidget(
      title: S.current.email,
      hint: S.current.enterYourEmail,
      controller: emailController,
      validator: Validators.emailValidator,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextFieldWidget(
      title: S.current.password,
      hint: S.current.enterYourPassword,
      controller: passwordController,
      isPassword: true,
      validator: Validators.passwordValidator,
    );
  }

  Widget _buildLoginButton() {
    return DefaultButton(
      title: S.current.signIn,
      isLoading: loading,
      onPressed: _onLoginPressed,
    );
  }

  void _onLoginPressed() {
    if (formKey.currentState!.validate()) {
      RouteGenerator.authCubit.login(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }

  void _onLoginSuccess(String uid) {
    CacheHelper.saveData(key: AppConstants.uidKey, value: uid).whenComplete(() {
      loading = false;
      AppConstants.uid = uid;
      RouteGenerator.router.go(Routes.tasksRoute);
    });
  }

  void _onLoginError(FirebaseException error) {
    loading = false;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error.message ?? ''),
        backgroundColor: ColorManager.errorColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
