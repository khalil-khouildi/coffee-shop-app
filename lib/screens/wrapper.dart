import 'package:firebas_serrie_coffee/models/user.dart';
import 'package:firebas_serrie_coffee/screens/authenticate/authenticate.dart';
import 'package:firebas_serrie_coffee/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
      final user = Provider.of<Userr?>(context);


    //return home or authenticate widget
    return user == null ? const Authenticate() : Home();
  }
}