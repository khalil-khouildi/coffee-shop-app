import 'package:firebas_serrie_coffee/models/user.dart';
import 'package:firebas_serrie_coffee/services/database.dart';
import 'package:firebas_serrie_coffee/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebas_serrie_coffee/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String? _currentName ;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Userr?>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user!.uid).userData,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          UserData userData = asyncSnapshot.data!;
          return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Text(
                'Update your brew settings.',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                initialValue: (_currentName ?? userData.name),
                decoration: textInputDecoration,
                validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(() => _currentName = val),
              ),
              const SizedBox(height: 20.0),
              DropdownButtonFormField(
                decoration: textInputDecoration,
                value: _currentSugars ?? userData.sugars,
                items: sugars.map((sugar) {
                  return DropdownMenuItem(
                    value: sugar,
                    child: Text('$sugar sugars'),
                  );
                }).toList(),
                onChanged: (val) => setState(() => _currentSugars = val as String),
              ),
        
              Slider(
                value: (_currentStrength ?? userData.strength).toDouble(),
                activeColor: Colors.brown[(_currentStrength ?? userData.strength)],
                min:100,
                max:900,
                divisions:8,
                onChanged: (val)=> setState(() => _currentStrength = val.round()),
              ),
        
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[400]),
                child: const Text('Update', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await DatabaseService(uid: user.uid).updateUserData(
                      _currentSugars ?? userData.sugars,
                      _currentName ?? userData.name,
                      _currentStrength ?? userData.strength,
                    );
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
        }
        else{
          return const Center(child: Loading());
        }
      }
    );
  }
}
