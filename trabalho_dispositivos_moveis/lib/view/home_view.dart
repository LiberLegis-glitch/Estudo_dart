import 'package:flutter/material.dart';
import '../model/usuario_model.dart';
import 'avisos_view.dart';
import 'biblioteca_view.dart';
import 'frequencia_view.dart';
import 'horario_view.dart';
import 'login_view.dart';
import 'notas_view.dart';
import 'perfil_view.dart';
import 'sobre_view.dart';

class HomeView extends StatefulWidget {
  final UsuarioModel usuario;
  const HomeView({super.key, required this.usuario});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late UsuarioModel _usuario;

  @override
  void initState() {
    super.initState();
    _usuario = widget.usuario;
  }

  void _ir(Widget tela) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => tela));

  Future<void> _abrirPerfil() async {
    Navigator.pop(context); // fecha o menu
    final atualizado = await Navigator.push<UsuarioModel>(
      context,
      MaterialPageRoute(builder: (_) => PerfilView(usuario: _usuario)),
    );
    // RF005: o novo nome passa a ser usado em toda a identificação do usuário.
    if (atualizado != null && mounted) {
      setState(() => _usuario = atualizado);
    }
  }

  void _abrirSobre() {
    Navigator.pop(context);
    _ir(const SobreView());
  }

  void _sair() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginView()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final inicial = _usuario.nome.trim().isEmpty
        ? '?'
        : _usuario.nome.trim()[0].toUpperCase();

    // RF006: funcionalidades específicas do portal (uma tela/arquivo cada).
    final funcionalidades = <(IconData, String, Widget)>[
      (Icons.grade_outlined, 'Notas', const NotasView()),
      (Icons.calendar_month_outlined, 'Horário', const HorarioView()),
      (Icons.fact_check_outlined, 'Frequência', const FrequenciaView()),
      (Icons.campaign_outlined, 'Avisos', const AvisosView()),
      (Icons.local_library_outlined, 'Biblioteca', const BibliotecaView()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Portal Integrado')),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(_usuario.nome),
                accountEmail: Text(_usuario.email),
                currentAccountPicture: CircleAvatar(child: Text(inicial)),
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Meu perfil'),
                onTap: _abrirPerfil,
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Sobre'),
                onTap: _abrirSobre,
              ),
              const Spacer(),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sair'),
                onTap: _sair,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Olá, ${_usuario.nome}!',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  for (final f in funcionalidades)
                    Card(
                      child: InkWell(
                        onTap: () => _ir(f.$3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(f.$1,
                                size: 44,
                                color: Theme.of(context).colorScheme.primary),
                            const SizedBox(height: 8),
                            Text(f.$2,
                                style:
                                    Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}