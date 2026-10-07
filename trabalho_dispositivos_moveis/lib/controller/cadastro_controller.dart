import '../model/usuario_model.dart';
import 'login_controller.dart';

class CadastroController {
  final _login = LoginController();

  // RF002 - passo 1: campos obrigatórios preenchidos
  String? validarNome(String? valor) {
    if (valor == null || valor.trim().isEmpty) return 'Informe o nome.';
    return null;
  }

  // RF002 - passo 2: formato de e-mail (reaproveita a regra do login)
  String? validarEmail(String? valor) => _login.validarEmail(valor);

  String? validarTelefone(String? valor) {
    final digitos = valor?.replaceAll(RegExp(r'\D'), '') ?? '';
    if (digitos.isEmpty) return 'Informe o telefone.';
    if (digitos.length < 10 || digitos.length > 11) {
      return 'Telefone inválido. Use DDD + número.';
    }
    return null;
  }

  String? validarSenha(String? valor) {
    if (valor == null || valor.isEmpty) return 'Informe a senha.';
    if (valor.length < 6) return 'A senha deve ter ao menos 6 caracteres.';
    return null;
  }

  // RF002 - passo 3: senha e confirmação iguais
  String? validarConfirmacao(String? valor, String senha) {
    if (valor == null || valor.isEmpty) return 'Confirme a senha.';
    if (valor != senha) return 'As senhas não coincidem.';
    return null;
  }

  // MOCK: troque pela chamada à API/Firebase da faculdade quando existir.
  Future<UsuarioModel> cadastrar({
    required String nome,
    required String email,
    required String telefone,
    required String senha,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return UsuarioModel(
      nome: nome.trim(),
      email: email.trim(),
      telefone: telefone.replaceAll(RegExp(r'\D'), ''),
    );
  }
}