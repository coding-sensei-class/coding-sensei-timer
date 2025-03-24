import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 타이머 프로바이더 : 뽀모도로 타이머 관리용
final timerNotifierProvider = StateNotifierProvider<TimerNotifier, TimerState>(
  (ref) => TimerNotifier(),
);

/// 타이머 상태를 나타내는 클래스
class TimerState {
  /// 현재 시간
  final int currentTime;

  /// 타이머가 실행 중인지 확인하기 위한 값
  final bool isRunning;

  /// 공부 중인지, 휴식 중인지 확인하기 위한 값
  final bool isStudyPhase;

  /// 타이머 상태의 초기화
  TimerState({
    required this.currentTime,
    required this.isRunning,
    required this.isStudyPhase,
  });

  /// 불변 객체
  TimerState copyWith({int? currentTime, bool? isRunning, bool? isStudyPhase}) {
    return TimerState(
      currentTime: currentTime ?? this.currentTime,
      isRunning: isRunning ?? this.isRunning,
      isStudyPhase: isStudyPhase ?? this.isStudyPhase,
    );
  }
}

/// 타이머 상태 관리용 클래스
class TimerNotifier extends StateNotifier<TimerState> {
  /// 가상의 사이버 타이머
  Timer? _timer;

  /// 공부 시간을 설정해주세요.
  final int startTime = 5;

  /// 휴식 시간을 설정해주세요.
  final int breakTime = 3;

  /// 타이머 상태의 초기화
  TimerNotifier()
    : super(TimerState(currentTime: 5, isRunning: false, isStudyPhase: true));

  /// 타이머 시작
  void startTimer() {
    if (!state.isRunning) {
      state = state.copyWith(isRunning: true);

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (state.currentTime > 0) {
          state = state.copyWith(currentTime: state.currentTime - 1);
        } else {
          if (state.isStudyPhase) {
            /// 스터디 페이즈가 끝났을 때
            print(' Study phase completed!');
            state = state.copyWith(currentTime: breakTime, isStudyPhase: false);
          } else {
            /// 휴식 페이즈가 끝났을 때
            print(' Break phase completed!');
            state = state.copyWith(currentTime: startTime, isStudyPhase: true);
          }
        }
      });
    }
  }

  /// 타이머 정지
  void pauseTimer() {
    if (state.isRunning) {
      _timer?.cancel();
      state = state.copyWith(isRunning: false);
    }
  }

  /// 타이머 초기화
  void resetTimer() {
    _timer?.cancel();
    state = state.copyWith(
      currentTime: startTime,
      isRunning: false,
      isStudyPhase: true,
    );
  }
}
