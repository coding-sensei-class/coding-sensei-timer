import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

// 음악 프로바이더
final musicNotifierProvider =
    StateNotifierProvider<MusicNotifier, MusicState>(
      (ref) =>
          MusicNotifier(),
    );

// 음악 상태 관리를 위한 NotifierProvider
class MusicNotifier extends StateNotifier<MusicState> {
  final audioPlayer = AudioPlayer();

  MusicNotifier() : super(const MusicState(isRunning: false)) {
    audioPlayer.setAsset('assets/Lonely Man - Alex Hamlin.mp3');
  }

  void play() {
    audioPlayer.play();
  }

  void stop() {
    audioPlayer.pause();
  }

  // 음악 재생/정지
  void toggleAnimation(bool isPlaying) {
    state = state.copyWith(isRunning: isPlaying);
  }
}

// 음악 상태를 나타내는 클래스
class MusicState {
  final bool isRunning;

  const MusicState({this.isRunning = false});

  MusicState copyWith({bool? isRunning}) {
    return MusicState(isRunning: isRunning ?? this.isRunning);
  }
}
