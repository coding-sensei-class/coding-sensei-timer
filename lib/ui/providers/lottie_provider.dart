import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 로티 프로바이더
final lottieNotifierProvider =
    StateNotifierProvider<LottieNotifier, LottieState>((ref) {
      return LottieNotifier();
    });

/// 로티 상태를 나타내는 클래스
class LottieState {
  /// 로티가 재생 중인지 확인하기 위한 값
  final bool isPlaying;

  /// 로티가 공부 중인지, 휴식 중인지 확인하기 위한 값
  final bool isStudyPhase;

  /// 로티 상태의 초기화
  const LottieState({this.isPlaying = false, this.isStudyPhase = true});

  /// 로티 상태의 복사
  LottieState copyWith({bool? isPlaying, bool? isStudyPhase}) {
    return LottieState(
      isPlaying: isPlaying ?? this.isPlaying,
      isStudyPhase: isStudyPhase ?? this.isStudyPhase,
    );
  }
}

/// 로티 상태 관리를 위한 NotifierProvider
class LottieNotifier extends StateNotifier<LottieState> {
  /// 로티 상태의 초기화
  LottieNotifier() : super(const LottieState());

  /// 애니메이션 재생/정지
  void toggleAnimation(bool isPlaying) {
    state = state.copyWith(isPlaying: isPlaying);
  }

  /// 스터디/휴식 페이즈 변경
  void setPhase(bool isStudyPhase) {
    state = state.copyWith(isStudyPhase: isStudyPhase);
  }
}
