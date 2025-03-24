import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer/ui/providers/lottie_provider.dart';
import 'package:timer/ui/providers/money_provider.dart';
import 'package:timer/ui/providers/timer_provider.dart';
import 'package:timer/ui/widgets/lottie_animation.dart';
import 'package:timer/ui/widgets/money_text.dart';
import 'package:timer/ui/widgets/timer_buttons.dart';
import 'package:timer/ui/widgets/timer_current_time_text.dart';

/// TimerScreen : 뽀모도로 타이머 화면
class TimerScreen extends ConsumerWidget {
  /// 가장 처음에 나오는 메인화면이자 타이머 화면입니다.
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerNotifierProvider);
    final lottieState = ref.watch(lottieNotifierProvider);
    final lottieNotifier = ref.read(lottieNotifierProvider.notifier);
    final moneyNotifier = ref.read(moneyNotifierProvider.notifier);

    /// 타이머 상태가 변경될 때마다 로티 상태와 음악 상태도 업데이트
    ref.listen(timerNotifierProvider, (previous, current) {
      lottieNotifier.setPhase(current.isStudyPhase);
      lottieNotifier.toggleAnimation(current.isRunning);
      
      // 타이머가 실행 중이고 공부 페이즈일 때만 금액 증가
      if (current.isRunning && current.isStudyPhase) {
        moneyNotifier.increaseAmount();
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MoneyText(),
                const SizedBox(height: 20),
                LottieAnimationWidget(
                  phase: lottieState.isStudyPhase,
                  animation: lottieState.isPlaying,
                  beforeIamge: 'assets/lotties/mine.json',
                  afterImage: 'assets/lotties/study.json',
                ),
                const SizedBox(height: 20),
                TimerCurrentTimeText(currentTime: timerState.currentTime),
                const SizedBox(height: 20),
                const TimerButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
