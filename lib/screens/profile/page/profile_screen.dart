import 'package:flutter/material.dart';
import 'package:splitty/screens/profile/sections/profile_header.dart';
import 'package:splitty/screens/profile/sections/profile_info.dart';
import 'package:splitty/screens/profile/sections/profile_notification.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32,
      children: [ProfileHeader(), ProfileInfo(), ProfileNotification()],
    );
  }
}
