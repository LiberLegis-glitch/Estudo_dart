import '../model/usuario_model.dart';
 
class LoginController {
  // RF001 - passo 1: campos preenchidos
  // RF001 - passo 2: formato de e-mail válido
  String? validarEmail(String? valor) {
    final email = valor?.trim() ?? '';
    if (email.isEmpty) return 'Informe o e-mail.';
    final regex = RegExp(r'^[\w\.\-+]+@([\w\-]+\.)+[a-zA-Z]{2,}$');
    if (!regex.hasMatch(email)) return 'Informe um e-mail válido.';
    return null;
  }
 
  String? validarSenha(String? valor) {
    if (valor == null || valor.isEmpty) return 'Informe a senha.';
    return null;
  }
 
  // RF001 - passo 4: autenticação.
  // MOCK: troque pela chamada à API/Firebase da faculdade quando existir.
  Future<UsuarioModel?> autenticar(String email, String senha) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email.trim() == 'aluno@faculdade.edu.br' && senha == '123456') {
      return const UsuarioModel(email: 'aluno@faculdade.edu.br', nome: 'Aluno Teste');
    }
    return null;
  }
}
 