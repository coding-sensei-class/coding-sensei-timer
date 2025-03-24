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
        _buildNeonButton(
          icon: timerState.isRunning ? Icons.pause : Icons.play_arrow,
          color: Colors.green,
          onPressed:
              timerState.isRunning
                  ? timerNotifier.pauseTimer
                  : timerNotifier.startTimer,
        ),
        const SizedBox(width: 20),
        _buildNeonButton(
          icon: Icons.restart_alt,
          color: Colors.red,
          onPressed: () {
            timerNotifier.resetTimer();
          },
        ),
      ],
    );
  }

  Widget _buildNeonButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.6),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.2),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
        ),
      ),
    );
  }
}
