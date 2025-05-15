


import 'dart:convert';

import 'package:flutter_taskone/qoute/quote.dart';
import 'package:http/http.dart' as http;


Future <List<Quote>> fetchQuote() async{

  final response= await http.get(Uri.parse('https://api.api-ninjas.com/v1/quotes'),
      headers: {
        'X-Api-Key': '+bRt2DNI9qs1uY16CN1zFA==x5L0JhV0iISRMj7s'
      }
      );

  if(response.statusCode == 200){
    List <dynamic> data= jsonDecode(response.body);
    return data.map((json) => Quote.fromJson(json)).toList();
  }
  throw Exception("Failed to fetch data!");

}