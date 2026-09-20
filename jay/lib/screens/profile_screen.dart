import 'package:flutter/material.dart';
import 'package:jay/widgets/common_app_bar.dart';
import 'package:jay/widgets/stat_item.dart';

import '../widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      appBar: CommonAppBar(title: '내 프로필'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ProfileHeader(),
                SizedBox(height: 24),
                StatItem(label: '본 영화', value: '24'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
