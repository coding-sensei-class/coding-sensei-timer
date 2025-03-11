import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer/ui/providers/lottie_provider.dart';
import 'package:timer/ui/providers/timer_provider.dart';
import 'package:timer/ui/widgets/lottie_animation_widget.dart';
import 'package:timer/ui/widgets/timer_control_buttons.dart';
import 'package:timer/ui/widgets/timer_time_text.dart';

/// TimerScreen : 뽀모도로 타이머 화면
class TimerScreen extends ConsumerWidget {
  /// 가장 처음에 나오는 메인화면이자 타이머 화면입니다.
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerNotifierProvider);
    final lottieState = ref.watch(lottieNotifierProvider);
    final lottieNotifier = ref.read(lottieNotifierProvider.notifier);

    /// 타이머 상태가 변경될 때마다 로티 상태와 음악 상태도 업데이트
    ref.listen(timerNotifierProvider, (previous, current) {
      lottieNotifier.setPhase(current.isStudyPhase);
      lottieNotifier.toggleAnimation(current.isRunning);
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
                TimerTimeText(currentTime: timerState.currentTime),
                const SizedBox(height: 20),
                const ControlButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
