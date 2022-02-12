abstract class Subscriber {
  void update() => throw Exception();
}

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
