class SingletonOne {
  SingletonOne._privateConstructor();

  static final SingletonOne _instance = SingletonOne._privateConstructor();

  factory SingletonOne() {
    return _instance;
  }
}

class SingletonTwo {
  SingletonTwo._privateConstructor();

  static final SingletonTwo _instance = SingletonTwo._privateConstructor();

  static SingletonTwo get instance => _instance;
}

class SingletonThree {
  SingletonThree._privateConstructor();

  static final SingletonThree instance = SingletonThree._privateConstructor();
}

void main() {
  var s1 = SingletonOne();
  var s2 = SingletonOne();
  print(identical(s1, s2)); // true
  print(s1 == s2); // true

  SingletonTwo two = SingletonTwo.instance;
  SingletonThree three = SingletonThree.instance;
}
