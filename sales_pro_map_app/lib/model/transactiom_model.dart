import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransModel {
  final String date;
  final dynamic mony;
  TransModel({
    required this.date,
    required this.mony,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'mony': mony,
    };
  }

  factory TransModel.fromMap(Map<String, dynamic> map) {
    return TransModel(
      date: map['date'] as String,
      mony: map['mony'] as dynamic,
    );
  }

 
}
