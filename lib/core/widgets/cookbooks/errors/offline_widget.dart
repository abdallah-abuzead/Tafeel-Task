import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/assets/app_images.dart';
import '../../../constants/messages/failure_messages.dart';
import '../../app_button.dart';

class OfflineWidget extends StatelessWidget {
  final Function() onPressed;
  final bool isStart;
  const OfflineWidget({Key? key, required this.onPressed, this.isStart = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: isStart ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          SizedBox(height: isStart ? 20 : 0),
          Lottie.asset(AppImages.lottieOffline, height: isStart ? 170 : 200),
          SizedBox(height: isStart ? 15 : 20),
          Text(
            FailureMessages.OFFLINE_FAILURE_MESSAGE,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.text.shade300),
          ),
          SizedBox(height: isStart ? 25 : 40),
          AppButton(
            title: 'Try Again',
            onPressed: onPressed,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            radius: 6,
          ),
        ],
      ),
    );
  }
}
