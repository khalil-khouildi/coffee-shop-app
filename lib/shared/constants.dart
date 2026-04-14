import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintText: 'Enter a value',
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.brown, width: 2.0,),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0,),
  ),
);