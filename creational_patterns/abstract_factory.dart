abstract class Button {
  void onTap() => throw Exception("Unimplemented Method");
}

abstract class Checkbox {
  void onTap() => throw Exception("Unimplemented Method");
}

class WinButton implements Button {
  @override
  void onTap() {
    print("Click do botão do Windows");
  }
}

class MacButton implements Button {
  @override
  void onTap() {
    print("Click do botão do Macbook");
  }
}

class WinCheckbox implements Checkbox {
  @override
  void onTap() {
    print("Click do checkbox do Windows");
  }
}

class MacCheckbox implements Checkbox {
  @override
  void onTap() {
    print("Click do checkbox do Macbook");
  }
}

abstract class GUIFactory {
  Button createButton() => throw Exception("Unimplemented Method");
  Checkbox createCheckbox() => throw Exception("Unimplemented Method");
}

class WinFactory implements GUIFactory {
  @override
  Button createButton() => new WinButton();

  @override
  Checkbox createCheckbox() => new WinCheckbox();
}

class MacFactory implements GUIFactory {
  @override
  Button createButton() => new MacButton();

  @override
  Checkbox createCheckbox() => new MacCheckbox();
}

class Aplication {
  final GUIFactory guiFactory;

  Aplication(this.guiFactory);

  late Button _button;
  late Checkbox _checkbox;

  void createUI() {
    print("Construindo a UI");
    _button = guiFactory.createButton();
    _checkbox = guiFactory.createCheckbox();
  }

  void test() {
    try {
      _button.onTap();
      _checkbox.onTap();
    } catch (e) {
      throw Exception("create the UI first");
    }
  }
}

enum TypeOS { Windows, MacOS }

class AplicationConfiguration {
  static Aplication init(TypeOS os) {
    switch (os) {
      case TypeOS.Windows:
        return new Aplication(new WinFactory());

      case TypeOS.MacOS:
        return new Aplication(new MacFactory());

      default:
        throw Exception("Error! Unknown operating system.");
    }
  }
}

void main() {
  Aplication macApp = AplicationConfiguration.init(TypeOS.MacOS);
  Aplication winApp = AplicationConfiguration.init(TypeOS.Windows);

  macApp.createUI();
  winApp.createUI();

  macApp.test();
  winApp.test();
}
