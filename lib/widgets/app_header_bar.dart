import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// Shared header bar. Takes data and callbacks only, never touches state
/// itself. Appears on Dashboard, Philosopher Card, and History.
class AppHeaderBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onBack;

  const AppHeaderBar({
    super.key,
    required this.title,
    this.subtitle,
    this.onBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      leading: onBack == null
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBack,
            ),
      automaticallyImplyLeading: onBack != null,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontSize: 20,
          )),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                subtitle!.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onPrimary.withValues(alpha: 0.85),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
