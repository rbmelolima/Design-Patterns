abstract class Shape {
  late int x;
  late int y;
  late String color;

  Shape(this.x, this.y, this.color);

  Shape.clone(Shape shape) {
    this.x = shape.x;
    this.y = shape.y;
    this.color = shape.color;
  }

  Shape clone() => throw Exception("Unimplemented Method");
}

class Rectangle implements Shape {
  late String color;
  late int x;
  late int y;

  Rectangle(this.x, this.y, this.color);

  Rectangle.clone(Shape shape) {
    this.x = shape.x;
    this.y = shape.y;
    this.color = shape.color;
  }

  @override
  Shape clone() {
    return new Rectangle.clone(this);
  }
}

class Square implements Shape {
  late String color;
  late int x;
  late int y;

  Square(this.x, this.y, this.color);

  Square.clone(Shape shape) {
    this.x = shape.x;
    this.y = shape.y;
    this.color = shape.color;
  }

  @override
  Shape clone() {
    return new Square.clone(this);
  }
}

class Application {
  List<Shape> _shapes = [];

  Application() {
    Square square = new Square(10, 10, "#FFFFFF");
    _shapes.add(square);
    Shape anotherSquare = square.clone();
    _shapes.add(anotherSquare);

    Rectangle rectangle = new Rectangle(40, 10, "#FFFFFF");
    _shapes.add(rectangle);
    Shape anotherRectangle = rectangle.clone();
    _shapes.add(anotherRectangle);
  }

  void printAllShapes() {
    _shapes.forEach((element) {
      print(
        "$element {" + element.x.toString() + " " + element.y.toString() + " " + element.color + " }",
      );
    });
  }
}

void main() {
  Application app = new Application();
  app.printAllShapes();
}
