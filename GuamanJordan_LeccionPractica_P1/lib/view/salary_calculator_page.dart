import 'package:flutter/material.dart';
import '../widgets/custom_widgets.dart';
import 'salary_calculator_form.dart';

class SalaryCalculatorPage extends StatelessWidget {
  const SalaryCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Sueldos XYZ'),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TitleText(text: 'Calculadora de Sueldos XYZ'),
              const SizedBox(height: 24.0),
              const SalaryCalculatorForm(),
            ],
          ),
        ),
      ),
    );
  }
}
