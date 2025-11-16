import 'package:flutter/material.dart';
import '../models/appointment_model.dart';
import 'new_appointment_screen.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  final List<AppointmentModel> _list = const [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(
            child: _list.isEmpty
                ? Center(child: Text('Aucun rendez-vous pour le moment'))
                : ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (_, i) => ListTile(title: Text(_list[i].centre)),
                  ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NewAppointmentScreen())),
            child: Text('Nouveau rendez-vous'),
          ),
        ],
      ),
    );
  }
}