import 'package:flutter/material.dart';
import 'package:recything_application/constants/app_theme_constant.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:recything_application/screens/customer_service/faq/customer_service_screen.dart';

void main() async {
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeConstant.appTheme,
      debugShowCheckedModeBanner: false,
      home: const CustomerServiceScreen(),
    );
  }
}
