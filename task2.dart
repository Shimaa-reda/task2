import 'task2.dart';

//Shimaa Reda Saeed
//task class
class task {
  String? task_name;
  bool isdeleiverd;
  task(this.task_name, this.isdeleiverd);
}

//person class===>base class
class Berson {
  final String? name;
  final int? age;
  final int? phone;
  final double? salary;
  final String? section;
  final bool? isAttend;

  //constructor
  Berson(
      {this.name,
      this.age,
      this.phone,
      this.salary,
      this.section,
      this.isAttend}) {}
}

//manager class==>child class
class Manager extends Berson {
  int Number_of_employees = 0;
  List<employee> employees = [];

  //constructor
  Manager({
    String? name,
    int? age,
    int? phone,
    double? salary,
    String? section,
    bool? isAttend,
    required this.Number_of_employees,
  }) : super(
            name: name,
            age: age,
            phone: phone,
            salary: salary,
            section: section,
            isAttend: isAttend);

//add_employee method
  void addEmployee(employee employee) {
    if (!(employees.contains(employee))) {
      employees.add(employee);
      Number_of_employees++;
    } else {
      print("The Employee: ${employee.name} is existed");
    }
  }

//add_task method to add task to specific task
  void add_Task(task task, employee employee) {
    if (employees.contains(employee)) {
      employee.tasks.add(task);
    } else {
      print(
          'The Employee: ${employee.name} is not  exist in your employees list');
    }
  }

//show_all_employees to print all details,tasks,deliver or not
  void show_all_employees() {
    for (int i = 0; i < employees.length; i++) {
      print('==============Details of Emplyee ${i + 1}:==============');
      print(
          'employee name: ${employees[i].name}\nemployee age: ${employees[i].age}\nemployee phone: ${employees[i].phone}\nemployee salary: ${employees[i].salary}\nemployee section: ${employees[i].section}\nemployee attend: ${employees[i].isAttend} ');
      print('==========undeliverd tasks:==========');
      employees[i].showTasks();
      print('=========deliverd tasks:=========');
      employees[i].Show_Deliverd_tasks();
    }
  }
}

//class employee==>child class
class employee extends Berson {
  List<task> tasks = [];
  List<task> delivered_tasks = [];
  employee(
      {String? name,
      int? age,
      int? phone,
      double? salary,
      String? section,
      bool? isattend})
      : super(
            name: name,
            age: age,
            phone: phone,
            salary: salary,
            section: section,
            isAttend: isattend);
//show tasks method to print all tasks
  void showTasks() {
    for (int i = 0; i < tasks.length; i++) {
      print('task name : ${tasks[i].task_name}');
      print('task is undeliverd');
    }
  }

//show tasks method to print all tasks
  void Show_Deliverd_tasks() {
    for (int i = 0; i < delivered_tasks.length; i++) {
      print('task name : ${delivered_tasks[i].task_name}');
      print('task deleiverd Sucessfully');
    }
  }

//deliver_task method
  void deliver_task(task task_) {
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].task_name == task_.task_name) {
        tasks[i].isdeleiverd = true;
        delivered_tasks.add(task_);
        tasks.removeAt(i);
        return;
      }
    }
  }
}

// void main() {
//   var person = Berson(
//       name: 'Shimaa',
//       age: 20,
//       phone: 01115565727,
//       salary: 234.5,
//       section: 'is');

//   var manager = Manager(
//       name: 'Reda',
//       age: 40,
//       phone: 01118010503,
//       salary: 2000.5,
//       section: 'manager',
//       Number_of_employees: 0);

//   var Employee1 = employee(
//       name: 'arwa',
//       age: 21,
//       phone: 01599999999,
//       salary: 2457,
//       section: 'IS',
//       isattend: true);

//   var Employee2 = employee(
//       name: 'Ali',
//       age: 23,
//       phone: 0108888999999,
//       salary: 3007,
//       section: 'DS',
//       isattend: false);

//   var task1 = task('task1', false);
//   var task2 = task('task2', false);
//   print('manager name is ${manager.name}');
//   print('employee name is ${Employee1.name}');
//   print('employee age is ${Employee1.age}');
//   manager.employees.add(Employee1);
//   manager.employees.add(Employee2);
//   manager.add_Task(task1, Employee1);
//   manager.add_Task(task2, Employee1);
//   Employee1.deliver_task(task1);
//   manager.add_Task(task2, Employee2);
//   print('================WELCOME IN RUN================');

//   manager.show_all_employees();
// }
