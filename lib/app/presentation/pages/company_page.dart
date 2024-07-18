import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/presentation/controllers/company_controller.dart';
import 'package:tractian_challenge/app/presentation/widgets/company_button.dart';
import 'package:tractian_challenge/app/presentation/widgets/reactive_state_widget.dart';
import 'package:tractian_challenge/app/presentation/widgets/retry_widget.dart';
import 'package:tractian_challenge/core/utils/extensions.dart';

class CompanyPage extends StatelessWidget {
  final CompanyController controller;
  const CompanyPage({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: context.scheme.secondary,
        title: Text(
          'TRACTIAN',
          style: context.text.headlineMedium?.copyWith(
            color: context.scheme.onSecondary,
          ),
        ),
      ),
      body: ReactiveStateWidget(
        listenable: controller.companiesState,
        onLoading: () => const Center(child: CircularProgressIndicator()),
        onError: (error) => RetryWidget(
          failure: error,
          onRetry: () {
            controller.fetchCompanies();
          },
        ),
        onSuccess: (data) {
          return ListView.separated(
            itemCount: data.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => CompanyButton(
              label: data[index].name,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/company',
                  arguments: data[index].id,
                );
              },
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
          );
        },
      ),
    );
  }
}
