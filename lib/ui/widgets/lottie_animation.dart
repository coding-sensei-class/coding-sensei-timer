import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// 로티 애니메이션 위젯
class LottieAnimationWidget extends StatelessWidget {
  /// 어떤 기준으로 로티 애니메이션을 보여줄지 확인하기 위한 값
  final bool phase;

  /// 애니메이션을 실행할지 말지 확인하기 위한 값
  final bool animation;

  /// 페이즈값이 true일 때 로티 이미지
  final String beforeIamge;

  /// 페이즈값이 false일 때 로티 이미지
  final String afterImage;

  /// 생성자
  const LottieAnimationWidget({
    super.key,
    required this.phase,
    required this.animation,
    required this.beforeIamge,
    required this.afterImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Lottie.asset(
        phase ? beforeIamge : afterImage,
        animate: animation,
        fit: BoxFit.contain,
      ),
    );
  }
}
