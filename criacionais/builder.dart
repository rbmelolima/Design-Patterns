// A interface builder especifica métodos para criar as
// diferentes partes de objetos produto.
abstract class Builder {
  void reset() => throw Exception("Unimplemented Method");
  void setSeats(int number) => throw Exception("Unimplemented Method");
  void setEngine(TypeEngine engine) => throw Exception("Unimplemented Method");
  void setTripeComputer(bool contains) => throw Exception("Unimplemented Method");
  void setGPS(bool contains);
}

enum TypeEngine { STICK_SHIFT, AUTOMATIC }

class Car {
  // Um carro pode ter um GPS, computador de bordo, e alguns
  // assentos. Diferentes modelos de carros (esportivo, SUV,
  // conversível) podem ter diferentes funcionalidades
  // instaladas ou equipadas.
}

class Manual {
  // Cada carro deve ter um manual do usuário que corresponda
  // a configuração do carro e descreva todas suas
  // funcionalidades.
}

class CarBuilder implements Builder {
  late Car _car;

  CarBuilder() {
    this.reset();
  }

  @override
  void reset() {
    this._car = new Car();
  }

  // Todas as etapas de produção trabalham com a mesma
  // instância de produto.
  @override
  void setEngine(TypeEngine engine) {
    // Instala um tipo de motor.
  }

  @override
  void setGPS(bool contains) {
    // Instala um sistema de posicionamento global.
  }

  @override
  void setSeats(int number) {
    // Define o número de assentos no carro.
  }

  @override
  void setTripeComputer(bool contains) {
    // Instala um computador de bordo.
  }

  /*
    Builders concretos devem fornecer seus próprios
    métodos para recuperar os resultados. Isso é porque
    vários tipos de builders podem criar produtos
    inteiramente diferentes que nem sempre seguem a mesma
    interface. Portanto, tais métodos não podem ser
    declarados na interface do builder (ao menos não em
    uma linguagem de programação de tipo estático).

    Geralmente, após retornar o resultado final para o
    cliente, espera-se que uma instância de builder comece
    a produzir outro produto. É por isso que é uma prática
    comum chamar o método reset no final do corpo do método
    `getProduct`. Contudo este comportamento não é
    obrigatório, e você pode fazer seu builder esperar por
    uma chamada explícita do reset a partir do código cliente
    antes de se livrar de seu resultado anterior.
 */
  Car getProduct() {
    Car product = this._car;
    this.reset();
    return product;
  }
}

class CarManualBuilder implements Builder {
  late Manual _manual;

  CarManual() {
    this.reset();
  }

  @override
  void reset() {
    this._manual = new Manual();
  }

  @override
  void setEngine(TypeEngine engine) {}

  @override
  void setGPS(bool contains) {}

  @override
  void setSeats(int number) {}

  @override
  void setTripeComputer(bool contains) {}

  Manual getProduct() {
    Manual product = this._manual;
    this.reset();
    return product;
  }
}

class Director {
  late Builder _builder;

  void setBuilder(Builder newBuilder) {
    this._builder = newBuilder;
  }

  void constructSportsCar(Builder builder) {
    builder.reset();
    builder.setSeats(2);
    builder.setGPS(true);
    builder.setTripeComputer(true);
    builder.setEngine(TypeEngine.AUTOMATIC);
  }

  void constructSUV(Builder builder) {
    builder.reset();
    builder.setSeats(4);
    builder.setGPS(true);
    builder.setTripeComputer(true);
    builder.setEngine(TypeEngine.STICK_SHIFT);
  }
}

void main() {
  Director director = new Director();

  CarBuilder builder1 = new CarBuilder();
  director.constructSportsCar(builder1);
  Car car = builder1.getProduct();

  CarManualBuilder builder2 = new CarManualBuilder();
  director.constructSportsCar(builder2);

  Manual manual = builder2.getProduct();
}
