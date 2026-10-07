import 'package:flutter/material.dart';
import '../model/academico_model.dart';

class NotasView extends StatelessWidget {
  const NotasView({super.key});

  Color _cor(String situacao) => switch (situacao) {
        'Aprovado' => Colors.green,
        'Recuperação' => Colors.orange,
        _ => Colors.red,
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notas')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: disciplinasMock.length,
        itemBuilder: (_, i) {
          final d = disciplinasMock[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(d.nome, style: Theme.of(context).textTheme.titleMedium),
                  Text(d.professor),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('N1: ${d.nota1.toStringAsFixed(1)}'),
                      Text('N2: ${d.nota2.toStringAsFixed(1)}'),
                      Text('Média: ${d.media.toStringAsFixed(1)}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Chip(
                    label: Text(d.situacao),
                    backgroundColor: _cor(d.situacao).withOpacity(0.15),
                    side: BorderSide(color: _cor(d.situacao)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}