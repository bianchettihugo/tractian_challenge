import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/presentation/controllers/company_controller.dart';
import 'package:tractian_challenge/app/presentation/controllers/item_controller.dart';
import 'package:tractian_challenge/app/presentation/pages/company_page.dart';
import 'package:tractian_challenge/app/presentation/pages/items_page.dart';
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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => CompanyPage(
              controller: Dependency.get<CompanyController>()..fetchCompanies(),
            ),
          );
        }

        if (settings.name == '/company') {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => args is! String
                ? const SizedBox()
                : ItemsPage(
                    companyId: args,
                    controller: Dependency.get<ItemsController>(),
                  ),
          );
        }
        return null;
      },
    );
  }
}
