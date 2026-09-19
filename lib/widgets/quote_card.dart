import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// The quote block at the top of the Philosopher Card.
class QuoteCard extends StatelessWidget {
  final String quote;
  final String source;

  const QuoteCard({super.key, required this.quote, required this.source});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '"$quote"',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                height: 1.4,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              source,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
