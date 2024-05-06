import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class google_map extends StatelessWidget {
  static final LatLng EdormLatLng = LatLng(  // ➊ 지도 초기화 위치
    37.3331,  // 위도
    127.2616,  // 경도
    // 한국외대 E동 남자 기숙사 위치 마킹
  );
  static final LatLng backLatLng = LatLng(  // ➊ 지도 초기화 위치
    37.3331,  // 위도
    127.2616,  // 경도
    // 한국외대 남자 기숙사 위치 마킹
  );
  static final LatLng engineeringLatLng = LatLng(  // ➊ 지도 초기화 위치
    37.3331,  // 위도
    127.2616,  // 경도
    // 한국외대 남자 기숙사 위치 마킹
  );

  static final Marker marker = Marker(
    markerId: MarkerId('company'),
    position: EdormLatLng,
  );
  static final Circle circle = Circle(
    circleId: CircleId('choolCheckCircle'),
    center: EdormLatLng, // 원의 중심이 되는 위치. LatLng값을 제공합니다.
    fillColor: Colors.blue.withOpacity(0.5), // 원의 색상
    radius: 100, // 원의 반지름 (미터 단위)
    strokeColor: Colors.blue, // 원의 테두리 색
    strokeWidth: 1, // 원의 테두리 두께
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder<String>(
          future: checkPermission(),
          builder: (context, snapshot) {
            // ❶ 로딩 상태
            if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // ➋ 권한 허가된 상태
            if(snapshot.data == '위치 권한이 허가 되었습니다.'){

              // 기존 Column 위젯 관련 코드
              return Column(
                children: [
                  Expanded( // 2/3만큼 공간 차지
                    flex: 2,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: EdormLatLng,
                        zoom: 16,
                      ),
                      myLocationEnabled: true,
                      markers: Set.from([marker]),
                      circles: Set.from([circle]),
                    ),
                  ),
                  Expanded(  // 1/3만큼 공간 차지
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            // 현재 위치를 가져오는 Geolocator 메서드
                            final Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

                            // AlertDialog를 통해 현재 위치의 위도와 경도 표시
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('현재 위치'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('위도: ${currentPosition.latitude}'),
                                        Text('경도: ${currentPosition.longitude}'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('확인'),
                                      onPressed: () {
                                        Navigator.of(context).pop();  // 다이얼로그 닫기
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,  // 버튼 배경 색상
                            minimumSize: Size(315, 48),  // 버튼 크기
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),  // 둥근 모서리
                              side: BorderSide(color: Colors.black, width: 2),  // 검은색 테두리 추가
                            ),
                            textStyle: TextStyle(fontSize: 20),  // 텍스트 스타일 설정
                          ),
                          child: Text(
                            '현재 위치 확인',  // 버튼 텍스트 변경
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            // ➌ 권한 없는 상태
            return Center(
              child: Text(
                snapshot.data.toString(),
              ),
            );
          }
      ),
    );
  }

  AppBar renderAppBar() {
    // AppBar를 구현하는 함수
    return AppBar(
      title: Text(
        '위치 정보 보내기',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();   // 위치 서비스 활성화여부 확인

    if (!isLocationEnabled) {  // 위치 서비스 활성화 안 됨
      return '위치 서비스를 활성화해주세요.';
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission();  // 위치 권한 확인

    if (checkedPermission == LocationPermission.denied) {  // 위치 권한 거절됨

      // 위치 권한 요청하기
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
      }
    }

    // 위치 권한 거절됨 (앱에서 재요청 불가)
    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 설정에서 허가해주세요.';
    }

    // 위 모든 조건이 통과되면 위치 권한 허가완료
    return '위치 권한이 허가 되었습니다.';
  }
}
