// Dados simulados do portal acadêmico.

String formatarData(DateTime d) =>
    '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

class Disciplina {
  final String nome;
  final String professor;
  final double nota1;
  final double nota2;
  final int faltas;
  final int totalAulas;

  const Disciplina(this.nome, this.professor, this.nota1, this.nota2,
      this.faltas, this.totalAulas);

  double get media => (nota1 + nota2) / 2;
  double get frequencia => 1 - faltas / totalAulas;
  String get situacao =>
      media >= 6 ? 'Aprovado' : (media >= 6 ? 'Recuperação' : 'Reprovado');
}

class Aula {
  final int dia; // 1 = segunda ... 5 = sexta
  final String horario;
  final String disciplina;
  final String sala;
  const Aula(this.dia, this.horario, this.disciplina, this.sala);
}

class Aviso {
  final String titulo;
  final String texto;
  final DateTime data;
  const Aviso(this.titulo, this.texto, this.data);
}

class Livro {
  final String titulo;
  final String autor;
  DateTime devolucao;
  int renovacoes;
  Livro(this.titulo, this.autor, this.devolucao, [this.renovacoes = 0]);
}

const disciplinasMock = [
  Disciplina('Programação Mobile', 'Prof. Silva', 8.5, 7.0, 4, 60),
  Disciplina('Banco de Dados', 'Profa. Costa', 5.0, 6.5, 10, 60),
  Disciplina('Engenharia de Software', 'Prof. Lima', 3.0, 4.5, 18, 60),
  Disciplina('Redes de Computadores', 'Profa. Rocha', 9.0, 8.0, 2, 60),
];

const aulasMock = [
  Aula(1, '08:00 - 09:40', 'Programação Mobile', 'Lab 3'),
  Aula(1, '10:00 - 11:40', 'Banco de Dados', 'Sala 12'),
  Aula(2, '08:00 - 09:40', 'Engenharia de Software', 'Sala 8'),
  Aula(3, '08:00 - 09:40', 'Redes de Computadores', 'Lab 1'),
  Aula(3, '10:00 - 11:40', 'Programação Mobile', 'Lab 3'),
  Aula(4, '10:00 - 11:40', 'Banco de Dados', 'Sala 12'),
  Aula(5, '08:00 - 09:40', 'Engenharia de Software', 'Sala 8'),
];

final avisosMock = [
  Aviso('Matrículas para o próximo semestre',
      'O período de rematrícula vai de 20/10 a 31/10 pelo portal. '
          'Verifique pendências financeiras e acadêmicas antes.',
      DateTime(2026, 10, 5)),
  Aviso('Semana de Tecnologia',
      'Palestras e oficinas abertas a todos os cursos no auditório principal.',
      DateTime(2026, 10, 2)),
  Aviso('Biblioteca com horário estendido',
      'Durante o período de provas, a biblioteca fecha às 22h.',
      DateTime(2026, 9, 28)),
];

final livrosMock = [
  Livro('Clean Code', 'Robert C. Martin', DateTime(2026, 10, 15)),
  Livro('Sistemas de Banco de Dados', 'Elmasri e Navathe', DateTime(2026, 10, 25), 1),
  Livro('Redes de Computadores', 'Andrew Tanenbaum', DateTime(2026, 9, 30)),
];