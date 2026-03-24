import 'package:flutter/material.dart';
import 'package:splitty/screens/profile/widgets/profile_config_tile.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(
          "Informações de Conta",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ProfileConfigTile(
          child: ListTile(
            leading: Icon(Icons.account_balance_wallet_outlined),
            title: Text("Chave Pix"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
        ProfileConfigTile(
          child: ListTile(
            leading: Icon(Icons.lock_outline),
            title: Text("Alterar Senha"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
        ProfileConfigTile(
          child: ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text("Sair da Conta"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
        ProfileConfigTile(
          child: ListTile(
            leading: Icon(Icons.delete_outline),
            title: Text("Excluir Conta"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
