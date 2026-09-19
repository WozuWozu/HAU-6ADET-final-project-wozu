import 'package:flutter/material.dart';
import '../models/philosopher.dart';
import '../theme/theme.dart';
import 'tag_chip.dart';

/// A single philosopher entry, reused for the Dashboard's "Recent" strip
/// and every row on the History screen. Data and a tap callback only.
class PhilosopherRow extends StatelessWidget {
  final Philosopher philosopher;
  final VoidCallback onTap;
  final bool showQuote;

  const PhilosopherRow({
    super.key,
    required this.philosopher,
    required this.onTap,
    this.showQuote = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: theme.colorScheme.secondaryContainer,
                // Square portrait cropped into a circle. If the asset is
                // missing, backgroundImage silently fails and the monogram
                // child below still shows through — no errorBuilder needed
                // here the way BookTile needs one for Image.asset.
                backgroundImage: philosopher.portraitAsset != null
                    ? AssetImage(philosopher.portraitAsset!)
                    : null,
                child: philosopher.portraitAsset != null
                    ? null
                    : Text(
                        philosopher.name.characters.first,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontSize: 18,
                          color: theme.colorScheme.primary,
                        ),
                      ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(philosopher.name,
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    TagChip(label: philosopher.ideology),
                    if (showQuote) ...[
                      const SizedBox(height: 6),
                      Text(
                        '"${philosopher.quote}"',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
            ],
          ),
        ),
      ),
    );
  }
}
