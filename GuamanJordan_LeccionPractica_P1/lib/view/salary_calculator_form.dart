import 'package:flutter/material.dart';
import '../widgets/custom_widgets.dart';
import '../controller/salary_controller.dart';
import '../model/employee.dart';

class SalaryCalculatorForm extends StatefulWidget {
  const SalaryCalculatorForm({super.key});

  @override
  State<SalaryCalculatorForm> createState() => _SalaryCalculatorFormState();
}

class _SalaryCalculatorFormState extends State<SalaryCalculatorForm> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _yearsController = TextEditingController();
  final _salaryController = SalaryController();
  
  double? _calculatedSalary;

  @override
  void dispose() {
    _ageController.dispose();
    _yearsController.dispose();
    super.dispose();
  }

  void _calculateSalary() {
    if (_formKey.currentState!.validate()) {
      try {
        final employee = Employee(
          age: int.parse(_ageController.text),
          yearsAtCompany: int.parse(_yearsController.text),
        );

        final salary = _salaryController.calculateSalary(employee);

        setState(() {
          _calculatedSalary = salary;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _clearForm() {
    _ageController.clear();
    _yearsController.clear();
    setState(() {
      _calculatedSalary = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmployeeInputField(
            controller: _ageController,
            label: 'Edad del Empleado',
            hint: 'Ingrese la edad (18-100)',
            validator: _salaryController.validateAge,
          ),
          const SizedBox(height: 16.0),
          EmployeeInputField(
            controller: _yearsController,
            label: 'Años en la Compañía',
            hint: 'Ingrese los años de antigüedad',
            validator: (value) => _salaryController.validateYearsAtCompany(
              value,
              int.tryParse(_ageController.text),
            ),
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Calcular',
                  onPressed: _calculateSalary,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: CustomButton(
                  text: 'Limpiar',
                  onPressed: _clearForm,
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
          if (_calculatedSalary != null) ...[
            const SizedBox(height: 32.0),
            SalaryResultCard(salary: _calculatedSalary!),
          ],
        ],
      ),
    );
  }
}
