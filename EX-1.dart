
enum Skill { FLUTTER, DART, OTHER }

class Adress {
  final String street;
  final String city;

  Adress(this.street,this.city);
}
class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Adress _address;
  final int _yearsOfExperience;
  
  Employee(this._name, this._baseSalary,this._skills,this._address,this._yearsOfExperience);

  Employee.mobileDeveloper(String name,double baseSalary , Adress address , int yearsOfExperience)
    :_name = name,
    _baseSalary = baseSalary,
    _skills = [Skill.FLUTTER,Skill.DART],
    _address = address,
    _yearsOfExperience = yearsOfExperience;

    String get name => _name;
    double get baseSalary => _baseSalary;
    List<Skill> get skill => _skills;
    Adress get adress => _address;
    int get yearsOfExperience => _yearsOfExperience;

    double computeSalary(){
      double salary = _baseSalary;
      salary += _yearsOfExperience * 2000;
      for (var skill in _skills){
        switch(skill){
          case Skill.FLUTTER:
          salary += 5000;
          break;
          case Skill.DART:
          salary += 3000;
          break;
          case Skill.OTHER:
          salary += 1000;
          break;
        }
      }
    return salary;
    }

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}');
    print('   >>> Skills: ${skill.map((skill) => skill.toString().split('.').last).join(', ')}');
    print('   >>> Address: ${adress.street}, ${adress.city}');
    print('   >>> Years of Experience: $yearsOfExperience');
    print('   >>> Computed Salary: \$${computeSalary()}');
    print("====================================================================");
  }
}

void main() {
  var address1 = Adress('6A Preak leab St', 'Phnom Penh');
  var emp1 = Employee('Sokea', 40000,[Skill.FLUTTER,Skill.DART],address1 ,5);
  emp1.printDetails();
   
  var address2 = Adress('6A Preak leab St', 'Phnom Penh');
  var emp2 = Employee('Ronan', 45000 ,[Skill.FLUTTER,Skill.DART],address2 ,3);
  emp2.printDetails();
}