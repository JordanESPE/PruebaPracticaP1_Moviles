import '../model/employee.dart';

class SalaryController {
  static const double baseSalary = 35000.0;//sueldo base 

  int _calculateSum(int n) {//suma de anios en la empresa
    return (n * (n + 1)) ~/ 2;
  }

  double calculateSalary(Employee employee) {//calcular sueldo del empleado
    if (!employee.isValid()) {
      throw Exception('Datos del empleado invalidos');
    }

    double agePart = employee.age.toDouble();//edad
    double yearsBonus = 100.0 * _calculateSum(employee.yearsAtCompany);//bono 
    
    return baseSalary + agePart + yearsBonus;//total
  }

  // validar la edad del empleado
  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese la edad';
    }
    
    final age = int.tryParse(value);
    if (age == null) {
      return 'Ingrese un numero valido';
    }
    
    if (age < 18 || age > 100) {
      return 'La edad debe estar entre 18 y 100 anios';
    }
    
    return null;
  }

  // validar los años en la compañía
  String? validateYearsAtCompany(String? value, int? age) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese los anios de antiguedad';
    }
    
    final years = int.tryParse(value);
    if (years == null) {
      return 'Ingrese un numero valido';
    }
    
    if (years < 0) {
      return 'Los anios de antiguedad no pueden ser negativos';
    }
    
    if (age != null && years > (age - 18)) {
      return 'Los anios de antiguedad no pueden exceder ${age - 18} anios';
    }
    
    return null;
  }
}
