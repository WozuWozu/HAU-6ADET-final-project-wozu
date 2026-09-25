import 'dart:math';
import 'package:flutter/material.dart';
import '../data/philosophers_data.dart';
import '../models/philosopher.dart';
import '../services/history_service.dart';
import '../theme/theme.dart';
import '../widgets/app_header_bar.dart';
import '../widgets/philosopher_row.dart';
import '../widgets/random_pick_button.dart';
import 'history_screen.dart';
import 'philosopher_card_screen.dart';

/// Screen 2 — Dashboard. Rolls a random philosopher and shows a "Recent"
/// strip pulled from shared_preferences history.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _historyService = HistoryService();
  final _random = Random();

  bool _isPicking = false;
  List<Philosopher> _recent = [];

  @override
  void initState() {
    super.initState();
    _loadRecent();
  }

  Future<void> _loadRecent() async {
    final ids = await _historyService.getHistory();
    final byId = {for (final p in philosopherPool) p.id: p};
    setState(() {
      _recent = ids.map((id) => byId[id]).whereType<Philosopher>().toList();
    });
  }

  Future<void> _pickRandom() async {
    setState(() => _isPicking = true);

    // A tiny delay so the loading state on RandomPickButton is visible —
    // this also stands in for the "spike" a real backend fetch would need.
    await Future.delayed(const Duration(milliseconds: 400));

    // Filters current history out of the pool
    final historyIds = await _historyService.getHistory();
    final eligible = philosopherPool
      .where((p) => !historyIds.contains(p.id))
      .toList();
    
    final pool = eligible.isNotEmpty ? eligible : philosopherPool;

    final pick = pool[_random.nextInt(pool.length)];
    await _historyService.addPick(pick.id);

    if (!mounted) return;
    setState(() => _isPicking = false);

    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PhilosopherCardScreen(philosopher: pick)),
    );
    _loadRecent();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const AppHeaderBar(
        title: 'THOUGHTFULL',
        subtitle: 'Daily Philosopher',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Tap the button below to receive your philosopher of the day.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.lg),
              RandomPickButton(onPressed: _pickRandom, isLoading: _isPicking),
              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('RECENT', style: theme.textTheme.labelSmall),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HistoryScreen()),
                    ),
                    child: const Text('View all →'),
                  ),
                ],
              ),
              Expanded(
                child: _recent.isEmpty
                    ? Center(
                        child: Text(
                          'No picks yet — your history will show up here.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: _recent.length,
                        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
                        itemBuilder: (context, i) {
                          final p = _recent[i];
                          return PhilosopherRow(
                            philosopher: p,
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => PhilosopherCardScreen(philosopher: p),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
