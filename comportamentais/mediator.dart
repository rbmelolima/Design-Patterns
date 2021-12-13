abstract class Mediator {
  void notify(dynamic sender, String event) => throw Exception();
}

class AuthenticationDialog implements Mediator {
  String title = "";
  late final Checkbox _loginOrRegisterChkbx;
  late final Textfield _loginUsername;
  late final Textfield _loginPassword;
  late final Textfield _registrationUsername;
  late final Textfield _registrationPassword;
  late final Textfield _registrationEmail;
  late final Button _okBtn;
  late final Button _cancelBtn;

  AuthenticationDialog({
    required Checkbox loginOrRegisterChkbx,
    required Textfield loginUsername,
    required Textfield loginPassword,
    required Textfield registrationUsername,
    required Textfield registrationPassword,
    required Textfield registrationEmail,
    required Button okBtn,
    required Button cancelBtn,
  }) {
    this._cancelBtn = cancelBtn;
    this._cancelBtn.setMediator(this);
    this._loginOrRegisterChkbx = loginOrRegisterChkbx;
    this._loginOrRegisterChkbx.setMediator(this);
    this._loginPassword = loginPassword;
    this._loginPassword.setMediator(this);
    this._loginUsername = loginUsername;
    this._loginUsername.setMediator(this);
    this._okBtn = okBtn;
    this._okBtn.setMediator(this);
    this._registrationEmail = registrationEmail;
    this._registrationEmail.setMediator(this);
    this._registrationPassword = registrationPassword;
    this._registrationPassword.setMediator(this);
    this._registrationUsername = registrationUsername;
    this._registrationUsername.setMediator(this);
  }

  @override
  void notify(sender, String event) {
    if (sender == _loginOrRegisterChkbx && event == "click") {
      if (_loginOrRegisterChkbx.checked) {
        this.title = "Login";
        print("Fazendo login");
        // 1 - Mostra componentes de formulário de login
        // 2 - Esconde componentes de formuário de registro
      } else {
        this.title = "Register";
        print("Fazendo o cadastro");
        // 1 - Mostra componentes de formulário de registro
        // 2 - Esconde componentes de formuário de login
      }
    }

    if (sender == _okBtn && event == "click") {
      print("Fazer submit");
    }

    if (sender == _cancelBtn && event == "click") {
      print("Cancelar operação e limpar campos");
    }
    // [...] Demais validações aqui
  }
}

class Component {
  late Mediator mediator;

  void setMediator(Mediator mediator) {
    this.mediator = mediator;
  }

  void click() {
    mediator.notify(this, "click");
  }

  void keypress() {
    mediator.notify(this, "keypress");
  }
}

class Checkbox extends Component {
  bool checked = false;

  void check() {
    mediator.notify(this, "check");
    this.checked = true;
  }
}

class Button extends Component {}

class Textfield extends Component {}

void main() {
  Checkbox loginOrRegisterChkbx = new Checkbox();
  Textfield loginUsername = new Textfield();
  Textfield loginPassword = new Textfield();
  Textfield registrationUsername = new Textfield();
  Textfield registrationPassword = new Textfield();
  Textfield registrationEmail = new Textfield();
  Button okBtn = new Button();
  Button cancelBtn = new Button();

  AuthenticationDialog appDialog = new AuthenticationDialog(
    cancelBtn: cancelBtn,
    loginOrRegisterChkbx: loginOrRegisterChkbx,
    loginPassword: loginPassword,
    loginUsername: loginUsername,
    okBtn: okBtn,
    registrationEmail: registrationEmail,
    registrationPassword: registrationPassword,
    registrationUsername: registrationUsername,
  );

  loginOrRegisterChkbx.click();
  okBtn.click();
  cancelBtn.click();
}
