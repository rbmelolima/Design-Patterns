/* 
  Em Dart não há como transformar métodos abstratos dentro de uma classe concreta.
  Considere o código abaixo, uma adaptação.
*/
abstract class AbstractClass {
  void build() {
    step1();
    step4();
    step3();
    step2();
  }

  void step1();

  void step2() {
    print("Step2 - Template");
  }

  void step3();

  void step4() {
    print("Step4 - Template");
  }
}

class ConcreteClass1 extends AbstractClass {
  @override
  void step1() {
    print("Step1 - Implementation [A]");
  }

  @override
  void step3() {
    print("Step3 - Implementation [A]");
  }
}

class ConcreteClass2 extends AbstractClass {
  @override
  void step1() {
    print("Step1 - Implementation [B]");
  }

  @override
  void step3() {
    print("Step3 - Implementation [B]");
  }
}

void main() {
  ConcreteClass1 class1 = new ConcreteClass1();
  ConcreteClass2 class2 = new ConcreteClass2();

  class1.build();
  print("\n");
  class2.build();
}
