import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// The Biography / Philosophy & Ideology accordion panels on the
/// Philosopher Card. Chosen over showing everything at once because the
/// mockup pass showed real bio + philosophy text overflows a fixed screen
/// (see the mockup's "What changed, and why" row).
class ExpandableSection extends StatefulWidget {
  final String title;
  final String body;
  final bool initiallyExpanded;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.body,
    this.initiallyExpanded = false,
  });

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  late bool _expanded = widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Theme(
        // Removes the default ExpansionTile divider lines so it matches
        // the flat card look from the mockup.
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: widget.initiallyExpanded,
          onExpansionChanged: (v) => setState(() => _expanded = v),
          title: Text(
            widget.title,
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          trailing: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
          childrenPadding: const EdgeInsets.fromLTRB(
            AppSpacing.md, 0, AppSpacing.md, AppSpacing.md,
          ),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.body,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
