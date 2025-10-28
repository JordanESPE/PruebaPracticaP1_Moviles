class Employee {
  final int age;
  final int yearsAtCompany;

  Employee({
    required this.age,
    required this.yearsAtCompany,
  });

  // verifica edad valida
  bool isValidAge() {
    return age >= 18 && age <= 100;
  }

  // verifica años en la compañía validos
  bool isValidYearsAtCompany() {
    return yearsAtCompany >= 0 && yearsAtCompany <= (age - 18);
  }

  // verifica que todos los datos sean validos
  bool isValid() {
    return isValidAge() && isValidYearsAtCompany();
  }
}
