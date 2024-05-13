import 'package:flutter/material.dart';

class Page31 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 40),
            Text(
              '한눈에 보기 쉬운',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 105.0),
              child: Text(
                '지도 기반 서비스',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              child: Image.asset(
                'lib/image/map32.png',
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}