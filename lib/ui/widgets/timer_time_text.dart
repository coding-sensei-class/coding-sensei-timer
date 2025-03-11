import 'package:flutter/material.dart';

/// TimerTimeText : 타이머 시간을 표시하는 위젯
class TimerTimeText extends StatelessWidget {
  /// 현재시각을 나타내는 값
  final int currentTime;

  /// 생성자
  const TimerTimeText({super.key, required this.currentTime});

  @override
  Widget build(BuildContext context) {
    return Text(
      _convertTime(currentTime),
      style: const TextStyle(fontSize: 30, color: Colors.white),
    );
  }

  // 시간을 00:00 형태로 변환시키는 함수
  String _convertTime(int time) {
    final minutes = time ~/ 60;
    final seconds = time % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
