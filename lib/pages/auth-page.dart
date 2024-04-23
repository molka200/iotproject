import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Center(
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Afficher un indicateur de chargement si la connexion est en cours
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Afficher un message d'erreur s'il y a une erreur
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData && snapshot.data != null) {
              // L'utilisateur est déjà connecté, rediriger vers une autre page
              return Text('Already authenticated!');
            } else {
              // L'utilisateur n'est pas connecté, afficher l'écran de connexion
              return ElevatedButton(
                onPressed: () {
                  // Ici, vous pouvez naviguer vers l'écran de connexion ou afficher un dialogue de connexion
                },
                child: Text('Login'),
              );
            }
          },
        ),
      ),
    );
  }
}
