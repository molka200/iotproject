import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Récupérer l'utilisateur actuellement connecté
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        // Ajouter un bouton de déconnexion dans la barre d'applications
        actions: [
          IconButton(
            onPressed: () {
              // Fonction pour déconnecter l'utilisateur
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: user != null
            ? Text(
                // Afficher l'email de l'utilisateur s'il est connecté
                "LOGGED IN AS: ${user.email}",
                style: TextStyle(fontSize: 20),
              )
            : Text(
                // Afficher un message si l'utilisateur n'est pas connecté
                "NOT LOGGED IN",
                style: TextStyle(fontSize: 20),
              ),
      ),
    );
  }
}
