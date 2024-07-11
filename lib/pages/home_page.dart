import 'package:calculator/components/box.dart';
import 'package:calculator/components/mode_button.dart';
import 'package:calculator/theme/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Get the current user from Firebase Auth
  final User? user = FirebaseAuth.instance.currentUser;

  // Sign out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: user != null
                ? Text(
                    "LOGGED IN AS: " + user!.email!,
                    style: TextStyle(fontSize: 20),
                  )
                : const Text(
                    "No user logged in",
                    style: TextStyle(fontSize: 20),
                  ),
          ),
          MyBox(
            color: Theme.of(context).colorScheme.primary,
            child: ModeButton(
              color: Theme.of(context).colorScheme.secondary,
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}
