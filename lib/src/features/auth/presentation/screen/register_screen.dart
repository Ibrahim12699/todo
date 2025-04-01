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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return _buildConsumer();
  }

  Widget _buildConsumer() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) {
        switch (state) {
          case RegisterSuccess(:final uid):
            _onRegisterSuccess(uid);
            break;
          case RegisterError(:final error):
            _onRegisterError(error);
            break;
          case RegisterLoading _:
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
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            24.verticalSpace,
            _buildNameField(),
            16.verticalSpace,
            _buildEmailField(),
            16.verticalSpace,
            _buildPasswordField(),
            24.verticalSpace,
            _buildRegisterButton(),
            24.verticalSpace,
            AgreeTermsWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return CustomTextFieldWidget(
      title: S.current.fullName,
      hint: S.current.enterYourName,
      controller: nameController,
      validator: Validators.nameValidator,
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

  Widget _buildRegisterButton() {
    return DefaultButton(
      title: S.current.createAccount,
      isLoading: loading,
      onPressed: _onRegisterPressed,
    );
  }

  void _onRegisterPressed() {
    if (formKey.currentState!.validate()) {
      RouteGenerator.authCubit.register(
        fullName: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }

  void _onRegisterSuccess(String uid) {
    CacheHelper.saveData(key: AppConstants.uidKey, value: uid).whenComplete(() {
      loading = false;
      AppConstants.uid = uid;
      RouteGenerator.router.go(Routes.tasksRoute);
    });
  }

  void _onRegisterError(FirebaseException error) {
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
    nameController.dispose();
    super.dispose();
  }
}
