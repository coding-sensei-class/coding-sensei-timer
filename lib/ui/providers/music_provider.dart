import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

/// 음악 프로바이더
final musicNotifierProvider = StateNotifierProvider<MusicNotifier, MusicState>(
  (ref) => MusicNotifier(),
);

/// 음악 상태 관리를 위한 NotifierProvider
class MusicNotifier extends StateNotifier<MusicState> {
  /// 음악 재생을 위한 AudioPlayer
  final audioPlayer = AudioPlayer();

  /// 음악 상태의 초기화
  MusicNotifier() : super(const MusicState(isRunning: false)) {
    audioPlayer.setAsset('assets/Lonely Man - Alex Hamlin.mp3');
  }

  /// 음악 재생
  void play() {
    audioPlayer.play();
  }

  /// 음악 정지
  void stop() {
    audioPlayer.pause();
  }

  /// 음악 재생/정지
  void toggleAnimation(bool isPlaying) {
    state = state.copyWith(isRunning: isPlaying);
  }
}

/// 음악 상태를 나타내는 클래스
class MusicState {
  /// 음악이 재생 중인지 확인하기 위한 값
  final bool isRunning;

  /// 음악 상태의 초기화
  const MusicState({this.isRunning = false});

  /// 음악 상태의 복사
  MusicState copyWith({bool? isRunning}) {
    return MusicState(isRunning: isRunning ?? this.isRunning);
  }
}
