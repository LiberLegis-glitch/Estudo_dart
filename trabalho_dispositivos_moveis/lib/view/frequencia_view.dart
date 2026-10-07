import 'package:flutter/material.dart';
import '../model/academico_model.dart';

class FrequenciaView extends StatelessWidget {
  const FrequenciaView({super.key});

  static const double minimo = 0.75; // frequência mínima exigida

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Frequência')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Frequência mínima exigida: 75%'),
          const SizedBox(height: 12),
          for (final d in disciplinasMock) _item(context, d),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, Disciplina d) {
    final emRisco = d.frequencia < minimo;
    final cor = emRisco ? Colors.red : Colors.green;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(d.nome, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: d.frequencia,
              color: cor,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 8),
            Text(
              '${(d.frequencia * 100).toStringAsFixed(0)}% de presença  •  '
              '${d.faltas} faltas em ${d.totalAulas} aulas',
            ),
            if (emRisco)
              const Text('Atenção: abaixo do mínimo exigido.',
                  style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}