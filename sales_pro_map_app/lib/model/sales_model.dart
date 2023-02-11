// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SalesModel {
  final String date;
  final dynamic sales;
  SalesModel({
    required this.date,
    required this.sales,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'sales': sales,
    };
  }

  factory SalesModel.fromMap(Map<String, dynamic> map) {
    return SalesModel(
      date: map['date'] as String,
      sales: map['sales'] ,
    );
  }

 
}
