import 'package:flutter/material.dart';

class ProfileMenuItem {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final int? badgeCount;
  final List<ProfileMenuItem> children;

  const ProfileMenuItem({
    required this.title,
    this.subtitle,
    this.icon,
    this.badgeCount,
    this.children = const []
  });

  bool get isExpandable => children.isNotEmpty;
}

const List<ProfileMenuItem> profileMenuMock = [
  ProfileMenuItem(
      title: 'Notificações',
      icon: Icons.notifications_none
  ),
  ProfileMenuItem(
      title: 'Clube iFood',
      icon: Icons.diamond_outlined
  ),
  ProfileMenuItem(
      title: 'Conta',
      subtitle: 'Endereços de entrega e favoritos',
      icon: Icons.person_outline,
      children: [
        ProfileMenuItem(title: 'Endereços'),
        ProfileMenuItem(title: 'Dados da conta'),
        ProfileMenuItem(title: 'Código de entrega'),
        ProfileMenuItem(title: 'Favoritos'),
      ]
  ),
];