import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:timer/timer_provider.dart';

import 'lottie_provider.dart';
import 'music_provider.dart';

/// TimerScreen : 뽀모도로 타이머 화면
class TimerScreen extends ConsumerWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerNotifierProvider);
    final timerNotifier = ref.read(timerNotifierProvider.notifier);
    final lottieState = ref.watch(lottieNotifierProvider);
    final lottieNotifier = ref.read(lottieNotifierProvider.notifier);
    final musicNotifier = ref.read(musicNotifierProvider.notifier);

    // 타이머 상태가 변경될 때마다 로티 상태와 음악 상태도 업데이트
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
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Lottie.asset(
                    lottieState.isStudyPhase
                        ? 'assets/whale.json'
                        : 'assets/pig.json',
                    animate: lottieState.isPlaying,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  timerState.isStudyPhase ? 'Study' : 'Rest',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  timerState.currentTime.toString(),
                  style: TextStyle(fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: timerNotifier.startTimer,
                      icon: Icon(Icons.not_started_outlined),
                    ),
                    IconButton(
                      onPressed: timerNotifier.pauseTimer,
                      icon: Icon(Icons.pause),
                    ),
                    IconButton(
                      onPressed: timerNotifier.resetTimer,
                      icon: Icon(Icons.restart_alt),
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
