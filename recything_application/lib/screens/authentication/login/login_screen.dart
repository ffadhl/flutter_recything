// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/authentication/register/register_screen.dart';
import 'package:recything_application/screens/home.dart';
import 'package:recything_application/services/authentication/login_authentication_service.dart';
import 'package:recything_application/widgets/global_button_widget.dart';
import 'package:recything_application/widgets/global_text_field_custom_widget.dart';

class LoginAuthenticationScreen extends StatefulWidget {
  const LoginAuthenticationScreen({super.key});

  @override
  State<LoginAuthenticationScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginAuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailtelpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _emailtelp = '';
  String _password = '';

  String? _errorEmailtelp;
  String? _errorPassword;

  bool _isObscurePassword = false;

  @override
  void dispose() {
    _emailtelpController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _resetVariable() {
    _emailtelp = '';
    _password = '';
    _errorEmailtelp = null;
    _errorPassword = null;
    _emailtelpController.clear();
    _passwordController.clear();
  }

  bool validation() {
    return _emailtelp != '' &&
        _password != '' &&
        _emailtelp.isNotEmpty &&
        _password.isNotEmpty;
  }

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final response = await LoginAuthenticationService().postLogin(
          email: _emailtelp,
          password: _password,
        );
        if (response.code == 200 || response.code == 201) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Success'),
              content: Text(
                response.message ?? 'Login success!',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomeAuthenticationScreen(),
                      ),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          _resetVariable();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: Text(response.message ?? 'Unknown error'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        _resetVariable();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred: $e'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.netralColor50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              ImageConstant.authImage,
              width: MediaQuery.of(context).size.width,
            ),
            SpacingConstant.verticalSpacing300,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      ImageConstant.logo,
                      width: 165.0,
                      height: 30.0,
                    ),
                  ),
                  SpacingConstant.verticalSpacing300,
                  Text(
                    'Masuk Akun',
                    style: TextStyleConstant.semiboldHeading4,
                  ),
                  Text(
                    'Mari bersama-sama terus berkontribusi! Segera masuk ke akun Anda',
                    style: TextStyleConstant.regularParagraph,
                    textAlign: TextAlign.justify,
                  ),
                  SpacingConstant.verticalSpacing300,
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFieldWidget(
                          label: 'Email / Nomor Telepon',
                          hint: 'Masukkan Email atau Nomor Telepon',
                          hintTextColor: const Color(0xFFCBCBCB),
                          controller: _emailtelpController,
                          onChanged: (String value) {
                            _emailtelp = value;
                            if (_emailtelp.isEmpty) {
                              _errorEmailtelp =
                                  'Email atau Nomor Telepon harus diisi.';
                            } else {
                              _errorEmailtelp = null;
                            }
                            setState(() {});
                          },
                          error: _errorEmailtelp,
                        ),
                        SpacingConstant.verticalSpacing200,
                        CustomTextFieldWidget(
                          isInputForPassword: true,
                          label: 'Password',
                          hint: 'Masukkan Password',
                          hintTextColor: const Color(0xFFCBCBCB),
                          controller: _passwordController,
                          obscureText: _isObscurePassword ? false : true,
                          suffixIconButton: IconButton(
                            icon: Icon(
                              _isObscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: ColorConstant.netralColor600,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscurePassword = !_isObscurePassword;
                              });
                            },
                          ),
                          onChanged: (String value) {
                            _password = value;
                            if (_password.isEmpty) {
                              _errorPassword = 'Password harus diisi.';
                            } else if (_password.length < 8) {
                              _errorPassword = 'Password minimal 8 karakter.';
                            } else {
                              _errorPassword = null;
                            }
                            setState(() {});
                          },
                          error: _errorPassword,
                        ),
                      ],
                    ),
                  ),
                  SpacingConstant.verticalSpacing400,
                  GlobalButtonWidget(
                    onTap: () {
                      if (validation()) {
                        _login();
                      }
                    },
                    width: double.infinity,
                    height: 40.0,
                    backgroundColor: ColorConstant.primaryColor500,
                    isBorder: false,
                    title: 'Login',
                    textColor: ColorConstant.whiteColor,
                    fontSize: 16.0,
                  ),
                  SpacingConstant.verticalSpacing300,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tidak Punya Akun? ',
                        style: TextStyleConstant.regularSubtitle
                            .copyWith(color: ColorConstant.netralColor600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterAuthenticationScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
                          style: TextStyleConstant.regularSubtitle
                              .copyWith(color: ColorConstant.primaryColor500),
                        ),
                      ),
                    ],
                  ),
                  SpacingConstant.verticalSpacing200,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
