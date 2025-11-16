import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/appointment_model.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return cred.user;
  }

  Future<User?> signUp(String email, String password, String name) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final user = cred.user;
    if (user != null) {
      await _db.collection('users').doc(user.uid).set({
        'id': user.uid,
        'nom': name,
        'email': email,
        'role': 'patient',
      });
    }
    return user;
  }

  Future<void> createAppointment(AppointmentModel appt) async {
    await _db.collection('appointments').doc(appt.id).set(appt.toMap());
  }
}