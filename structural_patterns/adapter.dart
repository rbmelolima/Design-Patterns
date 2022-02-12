/*  
  A Interface do Cliente descreve um protocolo que outras classes devem seguir para ser capaz de colaborar com o código cliente.
*/
abstract class ClientInterface {
  void method(String data);
}

/*
  O Serviço é alguma classe útil (geralmente de terceiros ou código legado). O cliente não pode usar essa classe diretamente porque ela tem uma interface incompatível.
*/
class Service {
  void serviceMethod(int specialData) {
    print('service method');
  }
}

/*
  O Adaptador é uma classe que é capaz de trabalhar tanto com o cliente quanto o serviço: ela implementa a interface do cliente enquanto encobre o objeto do serviço. O adaptador recebe chamadas do cliente através da interface do adaptador e as traduz em chamadas para o objeto encobrido do serviço em um formato que ele possa entender.
*/

class Adapter implements ClientInterface {
  Service service;

  Adapter(this.service);

  void method(String data) {
    service.serviceMethod(int.parse(data));
  }
}

/*
  O Cliente é uma classe que contém a lógica de negócio do programa existente.
*/
class Client {
  ClientInterface clientInterface;

  Client(this.clientInterface);

  void callMethod(String data) {
    clientInterface.method(data);
  }
}

void main() {
  Client client = Client(Adapter(Service()));
  client.callMethod('123');
}
