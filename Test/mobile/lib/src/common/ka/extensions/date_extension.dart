
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeExtension on TimeOfDay{
  String get formatTimeToFrench {
    var today = DateTime.now();
    return DateFormat('HH:mm','fr_FR').format(DateTime(today.year, today.month,hour,minute));
  }
}

