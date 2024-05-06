import 'package:flutter/material.dart';


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

class json_data_file extends StatelessWidget {
  final List<Facility> facilities = [
    Facility(
      name: "구갈레스피아 - 농구장",
      address: "경기도 용인시 기흥구 중부대로 640",
      usageFee: "무료",
    ),
    Facility(
      name: "구갈레스피아 - 풋살경기장",
      address: "경기도 용인시 기흥구 중부대로 640",
      usageFee: "무료",
    ),
    Facility(
      name: "성복고가도로하부 체육시설 - 풋살경기장",
      address: "수지구 성복동 602-8",
      usageFee: "무료",
    ),
  ];

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