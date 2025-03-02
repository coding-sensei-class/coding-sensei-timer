import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerNotifierProvider = StateNotifierProvider<TimerNotifier, TimerState>(
  (ref) => TimerNotifier(),
);

class TimerNotifier extends StateNotifier<TimerState> {
  Timer? _timer; // 가상의 사이버 타이머
  final int startTime = 5; // 25분 공부 시간
  final int breakTime = 3; // 5분 휴식 시간

  TimerNotifier()
      : super(TimerState(
    currentTime: 5,
    isRunning: false,
    isStudyPhase: true,
  ));

  // 할수 있는 일 1번
  void startTimer() {
    if (!state.isRunning) {
      state = state.copyWith(
        isRunning: true,
      );

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (state.currentTime > 0) {
          state = state.copyWith(currentTime: state.currentTime - 1);
        } else {
          if (state.isStudyPhase) {
            // 스터디 페이즈가 끝났을 때
            print(' Study phase completed!');
            state = state.copyWith(
              currentTime: breakTime,
              isStudyPhase: false,
            );
          } else {
            // 휴식 페이즈가 끝났을 때
            print(' Break phase completed!');
            state = state.copyWith(
              currentTime: startTime,
              isStudyPhase: true,
            );
          }
        }
      });
    }
  }

  // 할 수 있는 일 2번
  void pauseTimer() {
    if (state.isRunning) {
      _timer?.cancel();
      state = state.copyWith(isRunning: false);
    }
  }

  // 할 수 있는 일 3번
  void resetTimer() {
    _timer?.cancel();
    state = state.copyWith(
      currentTime: startTime,
      isRunning: false,
      isStudyPhase: true,
    );
  }
}

class TimerState {
  final int currentTime; // 현재 시간
  final bool isRunning; // 멈춰 있는지, 움직이고 있는지
  final bool isStudyPhase; // 공부 중인지, 휴식 중인지

  TimerState({
    required this.currentTime,
    required this.isRunning,
    required this.isStudyPhase,
  });

  // 불변 객체
  TimerState copyWith({
    int? currentTime,
    bool? isRunning,
    bool? isStudyPhase,
  }) {
    return TimerState(
      currentTime: currentTime ?? this.currentTime,
      isRunning: isRunning ?? this.isRunning,
      isStudyPhase: isStudyPhase ?? this.isStudyPhase,
    );
  }
}