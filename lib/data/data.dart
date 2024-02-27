import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String,dynamic>> data=[
  {
    'icon': const FaIcon(FontAwesomeIcons.burger,color: Colors.white,),
    'color':Colors.yellow,
    'name': 'Food',
    'totalAmount':'-₹1550',
    'date':'Today'
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.bagShopping,color: Colors.white,),
    'color':Colors.purple,
    'name': 'Shopping',
    'totalAmount':'-₹2050',
    'date':'Today'
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.heartCircleCheck,color: Colors.white,),
    'color':Colors.green,
    'name': 'Health',
    'totalAmount':'-₹1999',
    'date':'Yesterday'
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.plane,color: Colors.white,),
    'color':Colors.blue,
    'name': 'Travel',
    'totalAmount':'-₹950',
    'date':'Today'
  },
];