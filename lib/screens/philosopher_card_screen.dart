import 'package:flutter/material.dart';
import '../models/philosopher.dart';
import '../theme/theme.dart';
import '../widgets/app_header_bar.dart';
import '../widgets/book_tile.dart';
import '../widgets/expandable_section.dart';
import '../widgets/quote_card.dart';
import '../widgets/tag_chip.dart';

/// Screen 3 — Philosopher Card. Quote, biography, ideology, and books.
class PhilosopherCardScreen extends StatelessWidget {
  final Philosopher philosopher;

  const PhilosopherCardScreen({super.key, required this.philosopher});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppHeaderBar(
        title: philosopher.name,
        onBack: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _PortraitBanner(philosopher: philosopher),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(philosopher.era, style: theme.textTheme.labelSmall),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(philosopher.name, style: theme.textTheme.headlineSmall),
                      ),
                      TagChip(label: philosopher.ideology),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  QuoteCard(quote: philosopher.quote, source: philosopher.quoteSource),
                  const SizedBox(height: AppSpacing.md),
                  ExpandableSection(title: 'Biography', body: philosopher.bio),
                  const SizedBox(height: AppSpacing.sm),
                  ExpandableSection(title: 'Philosophy & Ideology', body: philosopher.philosophy),
                  const SizedBox(height: AppSpacing.lg),
                  Text('RECOMMENDED READING', style: theme.textTheme.labelSmall),
                  const SizedBox(height: AppSpacing.sm),
                  SizedBox(
                    height: 232,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: philosopher.books.length,
                      separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
                      itemBuilder: (context, i) {
                        final book = philosopher.books[i];
                        return BookTile(
                          title: book.title,
                          author: book.author,
                          coverAsset: book.coverAsset,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The portrait-bleeding-from-right-with-gradient header from the mockup
/// (mockup change log: "Portrait image bleeds from right with gradient
/// overlay"). Sits above the scrollable content, inside the ListView so it
/// scrolls away naturally rather than pinning.
class _PortraitBanner extends StatelessWidget {
  final Philosopher philosopher;

  const _PortraitBanner({required this.philosopher});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 180,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Base fill in case there's no portrait yet, or it fails to load.
          Container(color: theme.colorScheme.primary),
          if (philosopher.portraitAsset != null)
            Align(
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: 0.65,
                heightFactor: 1,
                child: Image.asset(
                  philosopher.portraitAsset!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox.shrink(),
                ),
              ),
            ),
          // Gradient so the header title text (drawn in AppHeaderBar above)
          // and this banner both stay legible against any portrait.
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primary.withValues(alpha: 0.15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
