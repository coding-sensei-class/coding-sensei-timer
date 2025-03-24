import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timer/ui/providers/money_provider.dart';

/// 현재 금액을 표시하는 위젯
class MoneyText extends ConsumerWidget {
  /// 생성자
  const MoneyText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moneyState = ref.watch(moneyNotifierProvider);
    final formatter = NumberFormat('#,###');
    
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.blue[50]!.withAlpha(30),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${formatter.format(moneyState.amount)}원',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blue[300],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 