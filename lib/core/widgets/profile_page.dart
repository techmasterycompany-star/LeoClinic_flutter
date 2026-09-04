import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leoclinic_flutter/core/constants/app_colors.dart';
import 'package:leoclinic_flutter/core/constants/app_text_style.dart';
import 'package:leoclinic_flutter/core/utils/pref-helper.dart';
import 'package:leoclinic_flutter/core/widgets/profile_bottom_tile.dart';
import 'package:leoclinic_flutter/core/widgets/profile_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = '';
  String _email = '';
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final name = await Prefhelper.getUserName();
    final email = await Prefhelper.getUserEmail();

    if (mounted) {
      setState(() {
        _name = name ?? '';
        _email = email ?? '';
      });
    }
  }

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
            onPressed: () async {
              Navigator.pop(dialogContext);
              await Prefhelper.deletetoken();
              await Prefhelper.deleteUserName();
              await Prefhelper.deleteUserEmail();
              if (context.mounted) {
                context.go('/login');
              }
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
          children: [
            ProfileCard(name: _name, email: _email, imagePath: _imagePath),
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
      ),
    );
  }
}
