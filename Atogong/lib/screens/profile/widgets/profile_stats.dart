import 'package:flutter/material.dart';

import 'stat_item.dart';

class ProfileStat {
  const ProfileStat({required this.label, required this.value});
  final String label;
  final String value;
}

const List<ProfileStat> profileStats = [
  ProfileStat(label: '본 영화', value: '342'),
  ProfileStat(label: '평점', value: '4.2'),
  ProfileStat(label: '즐겨찾기', value: '58'),
];

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: profileStats
          .map(
            (stat) => Expanded(
              child: StatItem(label: stat.label, value: stat.value),
            ),
          )
          .toList(),
    );
  }
}
