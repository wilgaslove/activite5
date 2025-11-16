import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../services/firebase_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtl = TextEditingController();
  final _passCtl = TextEditingController();
  final FirebaseService _service = FirebaseService();
  bool loading = false;

  void _login() async {
    setState(() => loading = true);
    try {
      final user = await _service.signIn(_emailCtl.text.trim(), _passCtl.text.trim());
      if (user != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur connexion: ' + e.toString())));
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('CareConnect', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                TextField(controller: _emailCtl, decoration: InputDecoration(labelText: 'Email')),
                SizedBox(height: 10),
                TextField(controller: _passCtl, decoration: InputDecoration(labelText: 'Mot de passe'), obscureText: true),
                SizedBox(height: 20),
                ElevatedButton(onPressed: loading ? null : _login, child: Text('Se connecter')),
                SizedBox(height: 10),
                TextButton(onPressed: () {}, child: Text("Créer un compte")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}