import 'package:flutter/material.dart';
import 'package:guia_restaurantes/models/profile_menu_item.dart';

class ProfileMenuTile extends StatelessWidget {

  final ProfileMenuItem item;

  const ProfileMenuTile({
    super.key,
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 1),
        item.isExpandable ? _buildExpandable() : _buildSimple()
      ],
    );
  }

  Widget _buildSimple() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(item.icon, color: Colors.black87),
      title: Text(item.title),
      subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }

  Widget _buildExpandable() {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      leading: Icon(item.icon, color: Colors.black87),
      title: Text(item.title),
      subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
      children: [
        for (var child in item.children)
          ProfileMenuTile(item: child)
      ],
    );
  }
}