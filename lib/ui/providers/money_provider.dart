import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoneyState {
  final int amount;

  const MoneyState({
    required this.amount,
  });

  MoneyState copyWith({
    int? amount,
  }) {
    return MoneyState(
      amount: amount ?? this.amount,
    );
  }
}

class MoneyNotifier extends StateNotifier<MoneyState> {
  MoneyNotifier() : super(const MoneyState(amount: 0));

  void increaseAmount() {
    state = state.copyWith(amount: state.amount + 100);
  }

  void resetAmount() {
    state = const MoneyState(amount: 0);
  }
}

final moneyNotifierProvider =
    StateNotifierProvider<MoneyNotifier, MoneyState>((ref) => MoneyNotifier()); 