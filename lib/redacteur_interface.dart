import 'package:flutter/material.dart';
import 'modele/redacteur.dart';
import 'database_manager.dart';

class RedacteurInterface extends StatefulWidget {
  const RedacteurInterface({super.key});

  @override
  State<RedacteurInterface> createState() => _RedacteurInterfaceState();
}

class _RedacteurInterfaceState extends State<RedacteurInterface> {
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _emailController = TextEditingController();

  List<Redacteur> redacteurs = [];

  @override
  void initState() {
    super.initState();
    _loadRedacteurs();
  }

  Future<void> _loadRedacteurs() async {
    final data = await DatabaseManager.instance.getAllRedacteurs();
    setState(() {
      redacteurs = data;
    });
  }

  Future<void> _ajouterRedacteur() async {
    final r = Redacteur(
      nom: _nomController.text,
      prenom: _prenomController.text,
      email: _emailController.text,
    );
    await DatabaseManager.instance.insertRedacteur(r);
    _nomController.clear();
    _prenomController.clear();
    _emailController.clear();
    _loadRedacteurs();
  }

  Future<void> _modifierRedacteur(Redacteur r) async {
    final nomCtrl = TextEditingController(text: r.nom);
    final prenomCtrl = TextEditingController(text: r.prenom);
    final emailCtrl = TextEditingController(text: r.email);

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Modifier rédacteur"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nomCtrl, decoration: const InputDecoration(labelText: "Nom")),
            TextField(controller: prenomCtrl, decoration: const InputDecoration(labelText: "Prénom")),
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: "Email")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Annuler")),
          ElevatedButton(
            onPressed: () async {
              final newR = Redacteur(
                id: r.id,
                nom: nomCtrl.text,
                prenom: prenomCtrl.text,
                email: emailCtrl.text,
              );
              await DatabaseManager.instance.updateRedacteur(newR);
              Navigator.pop(context);
              _loadRedacteurs();
            },
            child: const Text("Enregistrer"),
          ),
        ],
      ),
    );
  }

  Future<void> _supprimerRedacteur(int id) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirmation"),
        content: const Text("Voulez-vous vraiment supprimer ce rédacteur ?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Non")),
          ElevatedButton(
            onPressed: () async {
              await DatabaseManager.instance.deleteRedacteur(id);
              Navigator.pop(context);
              _loadRedacteurs();
            },
            child: const Text("Oui"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gestion des Rédacteurs")),
      body: Column(
        children: [
          TextField(controller: _nomController, decoration: const InputDecoration(labelText: "Nom")),
          TextField(controller: _prenomController, decoration: const InputDecoration(labelText: "Prénom")),
          TextField(controller: _emailController, decoration: const InputDecoration(labelText: "Email")),
          ElevatedButton.icon(
            onPressed: _ajouterRedacteur,
            icon: const Icon(Icons.add),
            label: const Text("Ajouter un Rédacteur"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: redacteurs.length,
              itemBuilder: (context, index) {
                final r = redacteurs[index];
                return ListTile(
                  title: Text("${r.nom} ${r.prenom}"),
                  subtitle: Text(r.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: const Icon(Icons.edit), onPressed: () => _modifierRedacteur(r)),
                      IconButton(icon: const Icon(Icons.delete), onPressed: () => _supprimerRedacteur(r.id!)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
