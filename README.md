# Padrões de projetos
Design Patterns (comumente relacionados na literatura de TI como “Padrões de Projeto”) são soluções para problemas comuns que encontramos no desenvolvimento ou manutenção de um software orientado a objetos (não são tão bem aplicáveis em outros paradigmas).

...

## Padrões criacionais
Os padrões criacionais fornecem vários mecanismos de criação de objetos, que aumentam a flexibilidade e reutilização de código já existente.

### 📌 [Factory Method](https://refactoring.guru/pt-br/design-patterns/factory-method)
Fornece uma interface para criar objetos em uma superclasse, mas permite que as subclasses alterem o tipo de objetos que serão criados. 

[💻 Implementação em Dart](./criacionais/factory.dart)

### 📌 [Abstract Factory](https://refactoring.guru/pt-br/design-patterns/abstract-factory)
Permite que você produza famílias de objetos relacionados sem ter que especificar suas classes concretas. 

[💻 Implementação em Dart](./criacionais/abstract_factory.dart)

### 📌 [Builder](https://refactoring.guru/pt-br/design-patterns/builder)
Permite a você construir objetos complexos passo a passo. O padrão permite que você produza diferentes tipos e representações de um objeto usando o mesmo código de construção. 

[💻 Implementação em Dart](./criacionais/builder.dart)

### 📌 [Factory](https://refactoring.guru/pt-br/design-patterns/prototype)
Permite copiar objetos existentes sem fazer seu código ficar dependente de suas classes. 

[💻 Implementação em Dart](./criacionais/factory.dart)

### 📌 [Singleton](https://refactoring.guru/pt-br/design-patterns/singleton)
Permite a você garantir que uma classe tenha apenas uma instância, enquanto provê um ponto de acesso global para essa instância. 

[💻 Implementação em Dart](./criacionais/singleton.dart)


...


## Padrões comportamentais
Os padrões comportamentais cuidam da comunicação eficiente e da assinalação de responsabilidades entre objetos.

### 📌 [Mediator](https://refactoring.guru/pt-br/design-patterns/mediator)
Permite que você reduza as dependências caóticas entre objetos. O padrão restringe comunicações diretas entre objetos e os força a colaborar apenas através do objeto mediador.

[💻 Implementação em Dart](./comportamentais/mediator.dart)

### 📌 [Observer](https://refactoring.guru/pt-br/design-patterns/observer)
Permite que você defina um mecanismo de assinatura para notificar múltiplos objetos sobre quaisquer eventos que aconteçam com o objeto que eles estão observando.

[💻 Implementação em Dart](./comportamentais/observer.dart)