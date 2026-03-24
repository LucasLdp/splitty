import 'package:flutter/material.dart';
import 'package:splitty/screens/profile/widgets/profile_config_tile.dart';

class ProfileNotification extends StatelessWidget {
  const ProfileNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(
          "Configurações de Notificações",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ProfileConfigTile(
          child: SwitchListTile(
            title: Text("Receber Notificações"),
            value: true,
            onChanged: (val) {},
          ),
        ),
      ],
    );
  }
}
