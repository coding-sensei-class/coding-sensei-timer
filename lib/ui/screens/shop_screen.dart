import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer/ui/widgets/custom_drawer.dart';
import 'package:timer/ui/widgets/money_text.dart';

/// 상점 화면
class ShopScreen extends ConsumerWidget {
  /// 생성자
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      endDrawer: const CustomDrawer(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: MoneyText(), // 현재 보유 금액 표시
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 한 줄에 2개의 아이템
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: shopItems.length,
              itemBuilder: (context, index) {
                final item = shopItems[index];
                return ShopItemCard(item: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// 상점 아이템 카드
class ShopItemCard extends StatelessWidget {
  /// 생성자
  final ShopItem item;

  /// 생성자
  const ShopItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Icon(
                  item.icon,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  '${item.price}원',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('구매하기'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 상점 아이템
class ShopItem {
  /// 이름
  final String name;

  /// 가격
  final int price;

  /// 아이콘
  final IconData icon;

  /// 생성자
  const ShopItem({required this.name, required this.price, required this.icon});
}

/// 상점 아이템 목록
final List<ShopItem> shopItems = [
  const ShopItem(name: '시간 부스터', price: 1000, icon: Icons.speed),
  const ShopItem(name: '골드 부스터', price: 2000, icon: Icons.monetization_on),
  const ShopItem(name: '집중력 강화', price: 3000, icon: Icons.psychology),
  const ShopItem(name: '타이머 스킨', price: 5000, icon: Icons.watch),
];
