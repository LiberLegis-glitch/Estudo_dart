import 'package:flutter/material.dart';
import '../model/academico_model.dart';

class AvisosView extends StatelessWidget {
  const AvisosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mural de avisos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final a in avisosMock)
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ExpansionTile(
                leading: const Icon(Icons.campaign_outlined),
                title: Text(a.titulo),
                subtitle: Text(formatarData(a.data)),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(a.texto)],
              ),
            ),
        ],
      ),
    );
  }
}