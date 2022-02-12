/*
  O Componente declara a interface comum tanto para os envoltórios como para os objetos envolvidos.
*/
abstract class Component {
  void execute();
}

/*
  O Componente Concreto é uma classe de objetos sendo envolvidos. Ela define o comportamento básico, que pode ser alterado por decoradores.
*/
class ConcreteComponent extends Component {
  @override
  void execute() {
    print('ConcreteComponent');
  }
}

/*
  A classe Decorador Base tem um campo para referenciar um objeto envolvido. O tipo do campo deve ser declarado assim como a interface do componente para que possa conter ambos os componentes concretos e os decoradores. O decorador base delega todas as operações para o objeto envolvido.
*/
class BaseDecorator extends Component {
  String _name;
  Component component;

  BaseDecorator(this.component, this._name);

  @override
  void execute() {
    component.execute();
    print('$_name');
  }
}

/*
  Os Decoradores Concretos definem os comportamentos adicionais que podem ser adicionados aos componentes dinamicamente. Os decoradores concretos sobrescrevem métodos do decorador base e executam seus comportamentos tanto antes como depois de chamarem o método pai.
*/
class ConcreteDecorator extends BaseDecorator {
  ConcreteDecorator(Component component, String name) : super(component, name);

  @override
  void execute() {
    super.execute();
  }
}

void main() {
  var class1 = new ConcreteComponent();
  var concreteDecorator = new ConcreteDecorator(class1, 'decorator1');
  var concreteDecorator2 = new ConcreteDecorator(concreteDecorator, 'decorator2');

  concreteDecorator2.execute();
}
