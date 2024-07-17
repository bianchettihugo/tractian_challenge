import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/presentation/controllers/company_controller.dart';
import 'package:tractian_challenge/app/presentation/pages/company_page.dart';
import 'package:tractian_challenge/core/themes/light_theme.dart';
import 'package:tractian_challenge/core/utils/dependency.dart';
import 'package:tractian_challenge/dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Dependencies.register();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tractian Challenge',
      theme: LightTheme.theme,
      debugShowCheckedModeBanner: false,
      home: CompanyPage(
        controller: Dependency.get<CompanyController>()..fetchCompanies(),
      ),
    );
  }
}
