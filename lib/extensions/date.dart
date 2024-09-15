import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Date on DateTime{
  DateTime dateOnly(){
    return DateTime(year,month,day);
  }
  String timeOnly(){
    return DateFormat('jm').format(this);
  }
  String toFormattedString(){
    return DateFormat('E, d MMMM yyyy').format(this);
  }
  String dayName(){
    return DateFormat('EEEE').format(this);
  }
  DateTime merged(TimeOfDay t){
    return DateTime(year,month,day,t.hour,t.minute);
  }
}