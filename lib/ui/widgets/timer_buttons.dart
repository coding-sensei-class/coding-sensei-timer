import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer/ui/providers/timer_provider.dart';

/// TimerButtons : 타이머 컨트롤 버튼을 나타내는 위젯
class TimerButtons extends ConsumerWidget {
  /// 생성자
  const TimerButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerNotifierProvider);
    final timerNotifier = ref.read(timerNotifierProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Timer Control Buttons
        NeonButton(
          icon: timerState.isRunning ? Icons.pause : Icons.play_arrow,
          color: Colors.green,
          onPressed:
              timerState.isRunning
                  ? timerNotifier.pauseTimer
                  : timerNotifier.startTimer,
        ),
        const SizedBox(width: 20),
        NeonButton(
          icon: Icons.restart_alt,
          color: Colors.red,
          onPressed: () {
            timerNotifier.resetTimer();
          },
        ),
      ],
    );
  }
}

/// NeonButton : 눌렀을 때 반짝이는 버튼 위젯
class NeonButton extends StatelessWidget {
  /// 아이콘
  final IconData icon;

  /// 색상
  final Color color;

  /// 눌렀을 때 실행할 함수
  final VoidCallback onPressed;

  /// 생성자
  const NeonButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withAlpha(60),
        ),
        child: Icon(icon, color: color, size: 32),
      ),
    );
  }
}
