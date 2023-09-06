import 'package:flutter/material.dart';
import 'package:tafeel/core/app_routes/app_router.dart';
import 'package:tafeel/core/constants/app_colors.dart';
import 'package:tafeel/core/widgets/app_text.dart';
import 'package:tafeel/modules/students/domain/entities/user.dart';
import 'package:tafeel/modules/students/presentation/screens/user_details_screen.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRouter.to(UserDetailsScreen(id: user.id)),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.border.shade100),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: Image.network(user.avatar, width: 118, fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          '${user.firstName} ${user.lastName}',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(height: 8),
                        AppText(
                          user.email,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  Divider(color: AppColors.border.shade100, height: 5, thickness: 1),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(5, (i) => const Icon(Icons.star_rounded, color: AppColors.success)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
