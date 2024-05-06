import 'package:flutter/material.dart';



class Page35 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                '약속 시간이 지나면',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                '채팅방은 자동 삭제됩니다',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 50),
              Image.asset(
                'lib/image/map33.png',
                width: 200,
              ),
              SizedBox(height: 20),// Static map image
            ],
          ),
        )
    );
  }

}