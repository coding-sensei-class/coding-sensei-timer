import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:timer/ui/providers/lottie_provider.dart';
import 'package:timer/ui/providers/music_provider.dart';
import 'package:timer/ui/providers/timer_provider.dart';

/// TimerScreen : 뽀모도로 타이머 화면
class TimerScreen extends ConsumerWidget {
  /// 가장 처음에 나오는 메인화면이자 타이머 화면입니다.
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerNotifierProvider);
    final timerNotifier = ref.read(timerNotifierProvider.notifier);
    final lottieState = ref.watch(lottieNotifierProvider);
    final lottieNotifier = ref.read(lottieNotifierProvider.notifier);
    final musicNotifier = ref.read(musicNotifierProvider.notifier);

    /// 타이머 상태가 변경될 때마다 로티 상태와 음악 상태도 업데이트
    ref.listen(timerNotifierProvider, (previous, current) {
      lottieNotifier.setPhase(current.isStudyPhase);
      lottieNotifier.toggleAnimation(current.isRunning);
      musicNotifier.toggleAnimation(current.isRunning);
    });

    ref.listen(musicNotifierProvider, (previous, current) {
      if (current.isRunning) {
        musicNotifier.play();
      }
      if (!current.isRunning) {
        musicNotifier.stop();
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieAnimationWidget(
                  phase: lottieState.isStudyPhase,
                  animation: lottieState.isPlaying,
                  beforeIamge: 'assets/whale.json',
                  afterImage: 'assets/pig.json',
                ),
                const SizedBox(height: 20),
                Text(
                  timerState.isStudyPhase ? 'Study' : 'Rest',
                  style: const TextStyle(fontSize: 25),
                ),
                Text(
                  timerState.currentTime.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: timerNotifier.startTimer,
                      icon: const Icon(Icons.not_started_outlined),
                    ),
                    IconButton(
                      onPressed: timerNotifier.pauseTimer,
                      icon: const Icon(Icons.pause),
                    ),
                    IconButton(
                      onPressed: timerNotifier.resetTimer,
                      icon: const Icon(Icons.restart_alt),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 로티 애니메이션 위젯
class LottieAnimationWidget extends StatelessWidget {
  /// 어떤 기준으로 로티 애니메이션을 보여줄지 확인하기 위한 값
  final bool phase;

  /// 애니메이션을 실행할지 말지 확인하기 위한 값
  final bool animation;

  /// 페이즈값이 true일 때 로티 이미지
  final String beforeIamge;

  /// 페이즈값이 false일 때 로티 이미지
  final String afterImage;

  /// 생성자
  const LottieAnimationWidget({
    super.key,
    required this.phase,
    required this.animation,
    required this.beforeIamge,
    required this.afterImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Lottie.asset(
        phase ? beforeIamge : afterImage,
        animate: animation,
        fit: BoxFit.contain,
      ),
    );
  }
}
