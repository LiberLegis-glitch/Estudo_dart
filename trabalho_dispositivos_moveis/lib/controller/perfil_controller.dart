import '../model/usuario_model.dart';

class PerfilController {
  static const int minimoCaracteresNome = 3;

  // RF005 - passos 1 e 2: nome preenchido e com tamanho mínimo
  String? validarNome(String? valor) {
    final nome = valor?.trim() ?? '';
    if (nome.isEmpty) return 'Informe o nome.';
    if (nome.length < minimoCaracteresNome) {
      return 'O nome deve ter ao menos $minimoCaracteresNome caracteres.';
    }
    return null;
  }

  // RF005 - passo 4: atualiza os dados e devolve o usuário atualizado.
  // MOCK: troque pela chamada real (API/Firebase) quando existir.
  Future<UsuarioModel> atualizar(UsuarioModel atual, String novoNome) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return atual.copyWith(nome: novoNome.trim());
  }
}