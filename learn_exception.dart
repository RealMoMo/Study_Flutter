main(){
  goThrow();

}

void goThrow() {
  try {
    getName2();
  } catch (e,s) {
    //函数 catch() 可以带有一个或者两个参数， 第一个参数为抛出的异常对象，
    // 第二个为堆栈信息 (一个 StackTrace 对象)。
    print("goThrow catch = $e,$s");
  } finally {
    print('goThrow finally');
  }
}

getName2() {
  //你可以使用on 或者 catch 来声明捕获语句，也可以同时使用。
  // 使用 on 来指定异常类型，使用 catch 来捕获异常对象。
  try {
    getName();
  } on Exception {
    print("getName2:Exception");
  } on NullThrownError catch (e) {
    print("getName2 on = $e");
    //使用 rethrow 关键字可以 把捕获的异常给 重新抛出。
    rethrow;
  } catch (e) {
    // 没指定类型，捕获任何异常类型
    print("getName2 catch $e");
  }
}

getName() {
  if (true) {
    throw new NullThrownError();
  }
}