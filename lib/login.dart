

import 'package:flutter/material.dart';

import '/map/google_map.dart';
import 'json_data/json.dart';
import 'slideview_register//mainslide.dart';


class loginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 180),
              Text(
                '스포팅과 함께\n건강한 나를 만들어보세요!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),



              SizedBox(height: 150),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the SecondPage when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mainslide()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  minimumSize: Size(315, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  textStyle: TextStyle(fontSize: 10),
                ),
                child: Text(
                  '회원가입 약정 페이지로 넘어가보기',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),



              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Show popup when "네이버로 시작하기" button is pressed
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(

                        content: Text(
                          '가입된 계정이 없습니다. \n 지금 회원가입하고 스포팅을 즐겨보세요',
                          textAlign: TextAlign.center,
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              minimumSize: Size(110, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              '닫기',
                              style: TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: Size(110, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              '회원가입',
                              style: TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(315, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  '회원가입 팝업창 확인해보기',
                  style: TextStyle(fontSize: 15, color: Colors.white),

                ),
              ),


              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the SecondPage when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => google_map()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(315, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black, width: 1), // 검은색 테두리 추가
                  ),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text(
                  '구글 맵 확인해보기',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the SecondPage when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JsonDataFile()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(315, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black, width: 2), // 검은색 테두리 추가
                  ),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text(
                  '용인시 체육시설 공공데이터 api 확인해보기',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Text(
                '고객문의',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}