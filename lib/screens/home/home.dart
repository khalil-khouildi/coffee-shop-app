import 'package:firebas_serrie_coffee/models/brew.dart';
import 'package:firebas_serrie_coffee/screens/home/settings_form.dart';
import 'package:firebas_serrie_coffee/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebas_serrie_coffee/services/database.dart';
import 'package:provider/provider.dart';
import 'package:firebas_serrie_coffee/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child : SettingsForm(),
          );
        },
      );
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      initialData: const [],
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text('Coffee Shop'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.logout, size: 20),
                label: const Text('Logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.settings, size: 20),
                label: const Text('Settings'),
                onPressed: () => _showSettingsPanel(),
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,   
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          child: const BrewList()
          ),
      ),
    );
  }
}
