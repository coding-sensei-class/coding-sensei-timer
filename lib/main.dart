import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer/ui/screens/timer_screen.dart';

// void : 아무 것도 리턴하지 않는 함수
void main() {
  // main -> appStart
  runApp(const ProviderScope(child: MyApp()));
}

/// 위젯 : 플러터의 가장 기본이 되는 화면 구성 단위
class MyApp extends StatelessWidget {
  /// StatelessWidget : 상태가 없는 위젯
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 테마! 스타일, 색상, 폰트 등을 설정\
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // 처음으로 보여줄 스크린 : home
      home: const TimerScreen(),
    );
  }
}
