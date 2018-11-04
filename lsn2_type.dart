/**
 * 主要学习Dart内置类型
 */


//程序入口函数
main(List<String> args){
  //如果传args参数 点运行的
  //向下的箭头->edit configuration -> 在program arguments输入相应的参数 多个参数，其间用空格分隔
  //print("args = ${args[0]}");


  printNumber(number);//The number is 42

  print("number ${number.runtimeType}");//number int
  print('number $number.runtimeType');//number 42.runtimeType

  learnAssert();

  learnString();

  learnNumberToString();

  learnBoolean();

  learnList();

  learnMap();

  learnRunes();

}

//1.start=======================================

//var一种不指定类型声明变量的方式
//定义一个变量,var 相当于dynamic
//42:字面量，编译时常量
var number = 42;

//没有val
//val test = 1;//报数

//Null类型只有null唯一实例对象
Null  only= null;

//方法的返回值可以不用声明
printNumber(num number){ //num类型 包含int double
  print("The number is $number");

}

//断言 assert
learnAssert(){

  assert(number == 42); //true不影响程序，false会中断程序
}

//1.end=================================



//2.start===============================

/**Dart的内置类型
 * number : int double num (没有float)
 * String
 * boolean
 * list
 * map
 * runes
 * symbols
 */

//number
int i1 = 12;
double d1 = 1.2;
num i2 = 12;
num d2 = 1.2;

//String
String s1 = "双引号 括住字符串 ok";
String  s2 = '单引号 括住字符串 ok';
//var s3 = '一个单引号 一个双引号 error";
//3个单引号or双引号 表示多行字符串
String s4 = '''abc  //跨行
    def''';
String s5 = 'abc'+'def';
String s6 = "abc"   //与s5效果一致
    "def";

String s7 = r"test \n 此r作用忽略转义字符";
String s8 = "test \n 转义字符";


learnString(){
  print("s1 $s1");
  print("s2 $s2");
  print("s4 $s4");
  /**
   s4 abc  //跨行
        def
  **/
  print("s5 $s5"); //s5 abcdef
  print("s6 $s6"); //s6 abcdef
  print("s7 $s7");//s7 test \n 此r作用忽略转义字符
  print("s8 $s8");
  /**
      s8 test
      转义字符
   */


}

//number类型与String类型的转换
learnNumberToString(){
  //String 转 Number
  var stringToInt = int.parse("222");
  var stringToDouble = double.parse("222");

  print("$stringToInt"); //222
  print("$stringToDouble"); //222.0

  //Int Double 转 String
  String s1 = 1.toString();
  String s2 = 1.245.toStringAsFixed(2); //1.25  会四舍五入的保留2位小数
  assert(s1 == '1');
  assert(s2 == '1.25');


}

learnBoolean(){
 //booean : just false & true
}

//List 叫列表
learnList(){

  assert([1,2,3][1] == 2);
  assert([1,2,3].length == 3);
  assert([].length == 0 );
  assert([].isEmpty == true);

  var list1 = [1,2,3];
  var list2 = [1,'string',3];
//  int list3 = [1,'2',3]; //会报错

print("list1 $list1");//list1 [1, 2, 3]
print("list2 $list2");//list2 [1, string, 3]


}

learnMap(){

  var colors1 = {
    'first':'red',
    'second':'green'
  };

  var color2 = new Map();
  color2['first'] = 'red';
  color2['second'] = 'green';


}

//Runes : utf16 utf32
learnRunes(){
  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.codeUnitAt(1));
  print(clapping.runes.toList());
  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));
}

//2.end ================================