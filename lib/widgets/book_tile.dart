import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// One book cover tile inside the horizontal "Recommended Reading" list
/// on the Philosopher Card.
class BookTile extends StatelessWidget {
  final String title;
  final String author;
  /// Optional asset path, e.g. 'assets/books/meditations.jpg'.
  /// Cover art is a 2:3 portrait rectangle — see the class doc comment
  /// below for the exact pixel sizes to export at.
  final String? coverAsset;

  const BookTile({
    super.key,
    required this.title,
    required this.author,
    this.coverAsset,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: coverAsset != null
                  ? Image.asset(
                      coverAsset!,
                      fit: BoxFit.cover,
                      // If the asset path is wrong or missing, don't crash —
                      // fall back to the placeholder tile instead.
                      errorBuilder: (context, error, stackTrace) =>
                          _placeholder(theme),
                    )
                  : _placeholder(theme),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
          ),
          Text(
            author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelSmall?.copyWith(
              letterSpacing: 0,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeholder(ThemeData theme) {
    return Container(
      color: theme.colorScheme.secondaryContainer,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(6),
      child: Text(
        title,
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.labelSmall?.copyWith(
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
