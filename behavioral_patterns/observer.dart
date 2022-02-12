/**
  A interface do Assinante declara a interface de notificação. Na maioria dos casos ela consiste de um único método atualizar. O método pode ter vários parâmetros que permite que a publicadora passe alguns detalhes do evento junto com a atualização.
 */
abstract class Subscriber {
  void update() => throw Exception();
}

/*
  A Publicadora manda eventos de interesse para outros objetos. Esses eventos ocorrem quando a publicadora muda seu estado ou executa algum comportamento. As publicadoras contêm uma infraestrutura de inscrição que permite novos assinantes se juntar aos atuais assinantes ou deixar a lista.
*/
class Publisher {
  List<Subscriber> _subscribers = [];

  void subscribe(Subscriber subscriber) {
    _subscribers.add(subscriber);
  }

  void unsubscribe(Subscriber subscriber) {
    _subscribers.remove(subscriber);
  }

  void notify() {
    _subscribers.forEach((element) {
      element.update();
    });
  }
}

class ConcreteSubscriber implements Subscriber {
  late final String _className;

  ConcreteSubscriber(this._className);

  @override
  void update() {
    print("Atualizando $_className");
  }
}

void main() {
  ConcreteSubscriber class1 = ConcreteSubscriber("class1");
  ConcreteSubscriber class2 = ConcreteSubscriber("class2");

  Publisher publisher = new Publisher();

  publisher.subscribe(class1);
  publisher.subscribe(class2);
  publisher.notify();

  print("\n\n");

  publisher.unsubscribe(class2);
  publisher.notify();
}
