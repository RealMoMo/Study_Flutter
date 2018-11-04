/**
 * 学习Dart 方法
 */

main(){



  //test 闭包==========
  var add1 = makeAdd(2);
  var add2 = makeAdd(3);

  var add3 = add1(3); //add1(3) => 3 + 3;
  var add4 = add2(5); //add2(5)=>4 + 5;

  print("add3 = $add3,add4 = $add4"); //add3 = 6,add4 = 9

  //  new Function();//错误的

  //==================

  var list = [1,2,3];
  //方法可以作为参数被调用
  list.forEach(printList);

  //匿名方法
  list.forEach((i){
    print(i);
  });

  //可选命名&可选位置=======
  FunA(1, b:2, e: 5);
  FunB(1,2,5);

  //==========


  learnOperator();
}

//============
//java 写法
String sayHello1(String name){
    return "hello1 $name";
}

//Dart写法
sayHello2(name){
  return "hello2 $name";
}

//只有一句 可简化此写法=>
//只能使用表达式，不能使用语句,返回一个单独的值
sayHello3(name) => "hello3 $name";

var a1;
sayHello4(name) => a1 = 1;

//把方法赋值给变量，类似c函数指针
var sayHello5 = (name) => 'hello5 $name';

//闭包
Function makeAdd(num addBy){
  addBy ++;
  return (num i)=>addBy + i ;
}

//typedef ---暂时只能定义函数（别名）
typedef int Compare(int a,int b);
int add(int a,int b) => a-b;

printList(name){
  print(name);
}

/**
 * 可选参数：可选命名，可选位置
 *
 * 大括号代表：  {可选命名} "= or :" 赋默认值
 *
 * 中括号代表：  [可选位置] "="赋默认值
 */
//可选命名
FunA(a, {b, c: 3, d = 4, e}) {
  print('$a,$b,$c,$d,$e');
}
//可选位置
FunB(a, [b, c = 3, d = 4, e]) {
  print('$a,$b,$c,$d,$e');
}


/**
 * 操作符
 * 介绍些与java不一样的操作符
 */

/**
 *  ~/  :除后取整
 *  5 ~/ 2 = 2; 5 / 2 = 2.5
 *
 *  as  is  is!
 *
 *  ?.   ??   ??=
 *
 *  ..  级联符号
 *
 *
 *  operator  可以重写的操作符
    <   +   |   []
    >   /   ^   []=
    <=  ~/ &   ~
    >=  *   <<  ==
    –   %   >>
 */
learnOperator(){

  List aa;
  aa?.asMap();

  //下面两个语句相等
//  String toString() =>msg?? super.toString();
//  String toString() =>msg? super.toString() :msg;

  int a1 = 2;
  a1 ??= 3;
  print('a1 = $a1');  //a1= 2

  int a2 ;
  a2 ??= 3;
  print('a2 = $a2');  //a2= 3

  //.. 级联符号，dart一个特殊语法
  Person p = new Person();
  p..name = "realmo"
  ..setCounty("china");
  print(p);

  //重写加号
  myString hello = new myString('hello');
  myString world = new myString('world');
  print(hello + world); //helloworldhello
}

class Person {
  String name;
  String country;

  void setCounty(String country) {
    this.country = country;
  }

  String toString() => "Name: $name\n Country : $country";
}

class myString {
  String str;

  myString(String str) {
    this.str = str;
  }

  String operator +(myString s){
    return '$str${s.str}$str';
  }
}
