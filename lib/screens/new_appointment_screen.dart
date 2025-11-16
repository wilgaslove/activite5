import 'package:flutter/material.dart';

class NewAppointmentScreen extends StatefulWidget {
  @override
  State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  final _centreCtl = TextEditingController();
  DateTime? _date;
  TimeOfDay? _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nouveau rendez-vous')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(controller: _centreCtl, decoration: InputDecoration(labelText: 'Centre')),
            SizedBox(height: 10),
            ListTile(
              title: Text(_date == null ? 'Choisir la date' : _date!.toLocal().toString().split(' ')[0]),
              leading: Icon(Icons.calendar_today),
              onTap: () async {
                final d = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now().subtract(Duration(days:365)), lastDate: DateTime.now().add(Duration(days:365)));
                if (d != null) setState(() => _date = d);
              },
            ),
            ListTile(
              title: Text(_time == null ? 'Choisir l\'heure' : _time!.format(context)),
              leading: Icon(Icons.access_time),
              onTap: () async {
                final t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                if (t != null) setState(() => _time = t);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('Enregistrer')),
          ],
        ),
      ),
    );
  }
}