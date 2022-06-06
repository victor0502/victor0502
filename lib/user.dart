import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Results {
  int? temp;
  String? date;
  String? time;
  String? conditionCode;
  String? description;
  String? currently;
  String? cid;
  String? city;
  String? imgId;
  int? humidity;
  String? windSpeedy;
  String? sunrise;
  String? sunset;
  String? conditionSlug;
  String? cityName;

  Results(
      {this.temp,
      this.date,
      this.time,
      this.conditionCode,
      this.description,
      this.currently,
      this.cid,
      this.city,
      this.imgId,
      this.humidity,
      this.windSpeedy,
      this.sunrise,
      this.sunset,
      this.conditionSlug,
      this.cityName});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(temp: json['temp'], city: json['city']);
  }
}

Future<Results> pegarGet() async {
  var baseUrl = 'https://api.hgbrasil.com/weather?woeid=455827';

  var url = baseUrl + '/';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    //var r = Results.fromJson(json.decode(response.body));
    return Results.fromJson(json.decode(response.body));
  } else {
    throw Exception('Falhou na requisicao de post');
  }
}

class teste extends StatefulWidget {
  const teste({Key? key}) : super(key: key);

  @override
  State<teste> createState() => _testeState();
}

class _testeState extends State<teste> with SingleTickerProviderStateMixin {
  late Future<Results> postagem;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    postagem = pegarGet();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Results>(
          future: postagem,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.city.toString());
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Text('buscando...');
          },
        ),
      ),
    );
  }
}
