import 'package:flutter/material.dart';

const klogintextStyle =
    TextStyle(fontSize: 30, fontFamily: "Pacifico", color: Colors.black54);
const kTextFieldDecoration = InputDecoration(
    icon: Icon(Icons.person, color: Colors.red, size: 30),
    hintText: 'Enter a value',
    hintStyle: TextStyle(fontSize: 15, fontFamily: 'Roboto'),
    //hintStyle: TextStyle(color: Colors.black),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
    border: InputBorder.none);
