import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Facility {
  final String name;
  final String address;
  final String usageFee;

  Facility({
    required this.name,
    required this.address,
    required this.usageFee,
  });
}

class JsonDataFile extends StatefulWidget {
  @override
  _JsonDataFileState createState() => _JsonDataFileState();
}

class _JsonDataFileState extends State<JsonDataFile> {
  List<Facility> facilities = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://apis.data.go.kr/4050000/sprtsfclts/getSprtsfclts?serviceKey=2TfWGOJWFWcpo4FvXm3bfxWN9Wkum8q46w6IG%2Fa4f7foSPeB49puLIuh7IeX0jfkoslp0DhNy7%2BYHWJxGDa4mw%3D%3D&pageNo=5&numOfRows=4'));
    final data = jsonDecode(response.body);
    final items = data['items'] as List<dynamic>;
    setState(() {
      facilities = items.map((item) => Facility(
        name: item['fclts_nm'],
        address: item['addr'],
        usageFee: item['use_fee'],
      )).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Facility List'),
        ),
        body: ListView.builder(
          itemCount: facilities.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(facilities[index].name),
              subtitle: Text(facilities[index].address),
              trailing: Text(facilities[index].usageFee),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(JsonDataFile());
}