import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MonApplication());
}

// ------------------------------------------------------------
// Classe 1 : MonApplication
// ------------------------------------------------------------
class MonApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application Météo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrevisionInterface(),
    );
  }
}

// ------------------------------------------------------------
// Classe 2 : PrevisionInterface 
// ------------------------------------------------------------
class PrevisionInterface extends StatefulWidget {
  @override
  _PrevisionInterfaceState createState() => _PrevisionInterfaceState();
}

class _PrevisionInterfaceState extends State<PrevisionInterface> {
  final TextEditingController _villeController = TextEditingController();

  bool _isLoading = false;
  Map<String, dynamic>? _DonneesMeteo;

  // Méthode de récupération des données depuis OpenWeather
  Future<void> _RecupererDonnees() async {
    final ville = _villeController.text.trim();
    if (ville.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    const String apiKey = "YOUR_API_KEY"; 
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$ville&appid=$apiKey&units=metric&lang=fr";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          _DonneesMeteo = json.decode(response.body);
        });
      } else {
        setState(() {
          _DonneesMeteo = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Ville introuvable ou erreur API.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur réseau")),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  // Interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prévisions Météo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _villeController,
              decoration: InputDecoration(
                labelText: "Entrez une ville",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),

            // Bouton
            ElevatedButton(
              onPressed: _RecupererDonnees,
              child: Text("Obtenir la météo"),
            ),

            SizedBox(height: 20),

            // Chargement
            if (_isLoading) CircularProgressIndicator(),

            // Données météo
            if (!_isLoading && _DonneesMeteo != null)
              DonneesMeteoWidget(donneesMeteo: _DonneesMeteo!),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// Classe 3 : DonneesMeteoWidget
// ------------------------------------------------------------
class DonneesMeteoWidget extends StatelessWidget {
  final Map<String, dynamic> donneesMeteo;

  DonneesMeteoWidget({required this.donneesMeteo});


  @override
  Widget build(BuildContext context) {
    final temperature = donneesMeteo["main"]["temp"];
    final description = donneesMeteo["weather"][0]["description"];

    return Card(
      elevation: 4,
      margin: EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("Température : $temperature °C",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Description : $description",
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
