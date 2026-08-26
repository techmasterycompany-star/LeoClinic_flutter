import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/widgets/profile_bottom_tile.dart';
import 'package:leoclinic_flutter/core/widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String? imagePath;

  const ProfilePage({
    super.key,
    required this.name,
    required this.email,
    this.imagePath,
  });

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Log Out', style: AppTextStyle.textstyle18),
        content: Text(
          'Are you sure you want to log out?',
          style: AppTextStyle.secondarytext,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              'Cancel',
              style: AppTextStyle.textstyle14.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.go('/login');
            },
            child: Text(
              'Log Out',
              style: AppTextStyle.textstyle14.copyWith(color: AppColors.failed),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
        children: [
          ProfileCard(name: name, email: email, imagePath: imagePath),
          const SizedBox(height: 24),
          ProfileBottomTile(
            title: 'Edit Profile',
            icon: Icons.edit_outlined,
            onTap: () {},
          ),
          const SizedBox(height: 8),
          ProfileBottomTile(
            title: 'My Requests',
            icon: Icons.request_page_outlined,
            onTap: () {},
          ),
          const SizedBox(height: 8),
          ProfileBottomTile(
            title: 'Payment',
            icon: Icons.payment_outlined,
            onTap: () {},
          ),
          const SizedBox(height: 8),
          ProfileBottomTile(
            title: 'Invite Friends',
            icon: Icons.person_add_outlined,
            onTap: () {},
          ),
          const SizedBox(height: 8),
          ProfileBottomTile(
            title: 'Log Out',
            icon: Icons.logout_outlined,
            showTrailing: false,
            onTap: () => _showLogoutDialog(context),
          ),
        ],
       ),
      ),
    );
  }
}
