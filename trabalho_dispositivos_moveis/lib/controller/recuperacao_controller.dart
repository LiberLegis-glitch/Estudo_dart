import 'login_controller.dart';

class RecuperarSenhaController {
  final _login = LoginController();

  // RF003 - passos 1 e 2: e-mail preenchido e com formato válido
  String? validarEmail(String? valor) => _login.validarEmail(valor);

  // RF003 - passo 3: dispara o envio das instruções de redefinição.
  // MOCK: troque pela chamada real (API/Firebase) quando existir.
  // O backend deve enviar o e-mail só se a conta existir, mas responder
  // sempre da mesma forma, para não revelar quais e-mails estão cadastrados.
  Future<void> solicitarRecuperacao(String email) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}