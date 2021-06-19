import 'dart:io';


void main() {
//  performTasks();

 // Isolate.spawn(task0, 1);
 // compute(task0, 1);
 final fu1 = Future.delayed(Duration(seconds: 1), info);

  final Future<int> fu2 = Future(info);
  fu1.then((value) => print(value)).catchError((error) => print(error)) ;


  print(1);
}

int info(){
  return 3 ;
}


void task0(int i){
  print('Task 0 start');
  sleep(Duration(seconds: i)) ;
  print('Task 0 complete');
}

void performTasks()  {
  task1();
  task2();
  task3();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

void task2()  {
  String result = 'task 2 data';
  print('Task 2 complete');
}

void task3() {
  String result = 'task 3 data';
  print('Task 3 complete');
}