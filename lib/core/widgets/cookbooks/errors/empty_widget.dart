import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/assets/app_images.dart';
import '../../app_button.dart';

class EmptyWidget extends StatelessWidget {
  final Function() onPressed;
  final String name;
  final bool isStart;
  const EmptyWidget({Key? key, required this.name, required this.onPressed, this.isStart = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: isStart ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Lottie.asset(AppImages.lottieEmpty, height: isStart ? 180 : 250),
          Text(
            'There is no $name yet',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.text.shade300),
          ),
          const SizedBox(height: 20),
          AppButton(
            title: 'Reload',
            onPressed: onPressed,
            radius: 6,
            icon: const Icon(Icons.add, size: 18),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ],
      ),
    );
  }
}
