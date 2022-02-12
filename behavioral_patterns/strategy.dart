abstract class Strategy {
  int calc(int a, int b) => throw Exception();
}

class ConcreteStrategySum implements Strategy {
  @override
  int calc(int a, int b) {
    return a + b;
  }
}

class ConcreteStrategySubtract implements Strategy {
  @override
  int calc(int a, int b) {
    return a - b;
  }
}

class ConcreteStrategyMultiply implements Strategy {
  @override
  int calc(int a, int b) {
    return a * b;
  }
}

class Context {
  late Strategy _strategy;

  void setStrategy(Strategy strategy) => _strategy = strategy;

  int calc(int a, int b) {
    return _strategy.calc(a, b);
  }
}

void main() {
  Strategy sum = new ConcreteStrategySum();
  Strategy subtract = new ConcreteStrategySubtract();
  Strategy multiply = new ConcreteStrategyMultiply();
  Context context = new Context();

  context.setStrategy(sum);
  print(context.calc(10, 5));

  context.setStrategy(subtract);
  print(context.calc(10, 5));

  context.setStrategy(multiply);
  print(context.calc(10, 5));
}
