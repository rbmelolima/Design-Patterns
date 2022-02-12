abstract class Transport {
  void delivery() => throw Exception("Unimplemented Method");
}

abstract class Logistics {
  Transport createTransport() => throw Exception("Unimplemented Method");
}

class Ship implements Transport {
  @override
  void delivery() {
    print("Transporting in ocean");
  }
}

class Truck implements Transport {
  @override
  void delivery() {
    print("Transporting in road");
  }
}

class SeaLogistics implements Logistics {
  @override
  Transport createTransport() {
    return new Ship();
  }
}

class RoadLogistics implements Logistics {
  @override
  Transport createTransport() {
    return new Truck();
  }
}

void main() {
  Logistics seaLogistics = new SeaLogistics();
  Logistics roadLogistics = new RoadLogistics();

  Transport truck = roadLogistics.createTransport();
  Transport ship = seaLogistics.createTransport();

  truck.delivery();
  ship.delivery();
}
