import 'package:flutter/material.dart';
import 'package:tafeel/core/constants/app_strings.dart';
import 'package:tafeel/core/widgets/app_button.dart';
import 'package:tafeel/modules/students/domain/entities/user.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_text.dart';

class UserDetailsBody extends StatelessWidget {
  const UserDetailsBody({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.bottomRight,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(user.avatar),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (i) => Icon(Icons.star_rounded, color: AppColors.charts.shade300)),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: AppText(
                  '${user.firstName} ${user.lastName}',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Center(child: AppText(user.email, fontWeight: FontWeight.w500, fontSize: 14)),
              const SizedBox(height: 30),
              const AppText('BIO', fontWeight: FontWeight.w500),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.border.shade100),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const AppText(AppStrings.lorem, fontSize: 13.5, height: 1.4),
              ),
              const SizedBox(height: 50),
              AppButton(title: 'Edit User', onPressed: () {}),
              const SizedBox(height: 16),
              AppButton(title: 'Delete User', onPressed: () {}, backgroundColor: AppColors.error),
            ],
          ),
        ),
      ],
    );
  }
}
