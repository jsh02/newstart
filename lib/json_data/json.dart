import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Facility { // 클래스
  final String name;
  final String address;
  final String usageFee;

  Facility({  // 생성자
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
  List<Facility> facilities = [];   // 스크롤리스트뷰로 용량에 상관없이 설정

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://apis.data.go.kr/4050000/sprtsfclts/getSprtsfclts?serviceKey=2TfWGOJWFWcpo4FvXm3bfxWN9Wkum8q46w6IG%2Fa4f7foSPeB49puLIuh7IeX0jfkoslp0DhNy7%2BYHWJxGDa4mw%3D%3D'
        '&pageNo=9&numOfRows=1'));
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
  // 추가하는 것 아래로 스크롤을 당기면 로딩바와 함께 pageNo를 1씩 증가 시켜서 결과화면 다시보기

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
          title: Text('서울시 공공체육시설 정보'),
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