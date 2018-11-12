import 'dart:async';

main() {
   //test1(); //f1 f2 2 4 f3 3 1

  test2(); //1 2 s1 s3 f1 f2 f3 s2 f4 f5 d1

}

test1() {
//  Future f1 = new Future(() => print("f1"));
//  Future f2 = new Future(() => print("f2"));
//  Future f3 = new Future(() => print("f3"));
  Future f1 = new Future(() => null);
  Future f2 = new Future(() => null);
  Future f3 = new Future(() => null);

  f3.then((_) => print('1'));

  f2.then((_) {
    print('2');
    new Future(() => print('3'));
    f1.then((_) {
      print("4");
    });
  });
}

test2() {
  print('1');

  scheduleMicrotask(() => print('s1'));

  new Future.delayed(new Duration(seconds: 1), () => print('d1'));

  new Future(() => print('f1')).then((_) {
    print('f2');
    scheduleMicrotask(() => print('s2'));
  }).then((_) => print('f3'));

  new Future(() => print('f4')).then((_) => print('f5'));

  scheduleMicrotask(() => print('s3'));

  print('2');
}
