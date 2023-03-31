
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class IsarProvider with ChangeNotifier {
   final Isar? _isar =
      Isar.getInstance("products"); 

  Isar? get isar => _isar;
}