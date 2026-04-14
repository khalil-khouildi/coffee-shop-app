import 'package:firebas_serrie_coffee/services/auth.dart';
import 'package:firebas_serrie_coffee/shared/constants.dart';
import 'package:firebas_serrie_coffee/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  

  final void Function() toggleView;
  Register({required this.toggleView});


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override

  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;


  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      // ADDED: Background image wrapper
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/coffee_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: const Text('Sign up to Coffee Shop'),
              actions: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.person),
                  label: const Text('Sign In'),
                  onPressed: () {
                    widget.toggleView();
                  },
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey, 
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val); 
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'Password'),
                        obscureText: true,
                        validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'please supply a valid email';
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        error,
                        style: const TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}