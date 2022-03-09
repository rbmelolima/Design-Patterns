class ComputerContext {
  ComputerState state;

  ComputerContext(this.state);

  void changeState(ComputerState newState) => state = newState;

  void touchButtonPower() {
    state.touch(this);
  }
}

abstract class ComputerState {
  void touch(ComputerContext context);
}

class ComputerOnline implements ComputerState {
  @override
  void touch(ComputerContext context) {
    print("Baixando atualizações...");
    print("Desligando o computador...");
    context.state = ComputerOffline();
  }
}

class ComputerOffline implements ComputerState {
  @override
  void touch(ComputerContext context) {
    print("Ligando o computador...");
    context.state = ComputerOnline();
  }
}

void main() {
  ComputerContext computer = ComputerContext(ComputerOffline());
  computer.touchButtonPower();
  print("Duas horas de uso depois...");
  computer.touchButtonPower();
}