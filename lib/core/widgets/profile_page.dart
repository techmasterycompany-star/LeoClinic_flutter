import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Log Out', style: AppTextStyle.textstyle18),
        content: Text(
          'Are you sure you want to log out?',
          style: AppTextStyle.secondarytext,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: AppTextStyle.textstyle14.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/login');
            },
            child: Text(
              'Log Out',
              style: AppTextStyle.textstyle14.copyWith(
                color: AppColors.failed,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          ProfileCard(name: name, email: email, imagePath: imagePath),
          SizedBox(height: 24.h),
          ProfileBottomTile(
            title: 'Edit Profile',
            icon: Icons.edit_outlined,
            onTap: () {},
          ),
          SizedBox(height: 8.h),
          ProfileBottomTile(
            title: 'My Requests',
            icon: Icons.request_page_outlined,
            onTap: () {},
          ),
          SizedBox(height: 8.h),
          ProfileBottomTile(
            title: 'Payment',
            icon: Icons.payment_outlined,
            onTap: () {},
          ),
          SizedBox(height: 8.h),
          ProfileBottomTile(
            title: 'Invite Friends',
            icon: Icons.person_add_outlined,
            onTap: () {},
          ),
          SizedBox(height: 8.h),
          ProfileBottomTile(
            title: 'Log Out',
            icon: Icons.logout_outlined,
            showTrailing: false,
            onTap: () => _showLogoutDialog(context),
          ),
        ],
      ),
    );
  }
}
