/*
  A interface Estratégia é comum à todas as estratégias concretas. Ela declara um método que o contexto usa para executar uma estratégia.
*/
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

/**
  O Contexto mantém uma referência para uma das estratégias concretas e se comunica com esse objeto através da interface da estratégia.
 */
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
