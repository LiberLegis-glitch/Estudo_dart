class UsuarioModel {
  final String nome;
  final String email;
  final String telefone;

  const UsuarioModel({
    required this.nome,
    required this.email,
    this.telefone = '',
  });

  UsuarioModel copyWith({String? nome, String? telefone}) {
    return UsuarioModel(
      nome: nome ?? this.nome,
      email: email, // o e-mail não pode ser alterado pelo perfil
      telefone: telefone ?? this.telefone,
    );
  }
}