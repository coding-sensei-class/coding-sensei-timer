import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 머니 프로바이더
final moneyNotifierProvider = StateNotifierProvider<MoneyNotifier, MoneyState>((
  ref,
) {
  return MoneyNotifier();
});

/// 로티 상태를 나타내는 클래스
class MoneyState {
  /// 현재 금액
  final int amount;

  /// 돈 상태의 초기화
  const MoneyState({required this.amount});

  /// 불변 객체
  MoneyState copyWith({int? amount}) {
    return MoneyState(amount: amount ?? this.amount);
  }
}

/// 돈 상태를 관리하는 노티파이어
class MoneyNotifier extends StateNotifier<MoneyState> {
  /// 돈 상태의 초기화
  MoneyNotifier() : super(const MoneyState(amount: 0));

  /// 금액 증가
  void increaseAmount() {
    state = state.copyWith(amount: state.amount + 100);
  }
}
