import 'package:flutter/material.dart';
import '../model/academico_model.dart';

class BibliotecaView extends StatefulWidget {
  const BibliotecaView({super.key});

  @override
  State<BibliotecaView> createState() => _BibliotecaViewState();
}

class _BibliotecaViewState extends State<BibliotecaView> {
  static const int maxRenovacoes = 2;

  bool _atrasado(Livro l) => l.devolucao.isBefore(DateTime.now());

  void _renovar(Livro l) {
    setState(() {
      l.devolucao = l.devolucao.add(const Duration(days: 7));
      l.renovacoes++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Renovado até ${formatarData(l.devolucao)}.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biblioteca')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final l in livrosMock)
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.titulo,
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(l.autor),
                    const SizedBox(height: 8),
                    Text(
                      _atrasado(l)
                          ? 'Atrasado! Devolução era ${formatarData(l.devolucao)}'
                          : 'Devolução: ${formatarData(l.devolucao)}',
                      style: TextStyle(
                          color: _atrasado(l) ? Colors.red : null),
                    ),
                    Text('Renovações: ${l.renovacoes}/$maxRenovacoes'),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FilledButton.tonal(
                        onPressed: _atrasado(l) || l.renovacoes >= maxRenovacoes
                            ? null
                            : () => _renovar(l),
                        child: const Text('Renovar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}