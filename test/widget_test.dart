import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('0')));
  }
}

void main() {
  testWidgets('텍스트 위젯에 "0"이 표시되는지 확인', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MyApp()));
    expect(find.text('0'), findsOneWidget);
  });
}
