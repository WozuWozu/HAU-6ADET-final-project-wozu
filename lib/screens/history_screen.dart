import 'package:flutter/material.dart';
import '../data/philosophers_data.dart';
import '../models/philosopher.dart';
import '../services/history_service.dart';
import '../theme/theme.dart';
import '../widgets/app_header_bar.dart';
import '../widgets/philosopher_row.dart';
import 'philosopher_card_screen.dart';

/// Screen 4 — History. Lets you see the 2–4 most recently picked
/// philosophers, read from shared_preferences.
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _historyService = HistoryService();
  List<Philosopher> _history = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final ids = await _historyService.getHistory();
    final byId = {for (final p in philosopherPool) p.id: p};
    setState(() {
      _history = ids.map((id) => byId[id]).whereType<Philosopher>().toList();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppHeaderBar(
        title: 'History',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('YOUR PAST PHILOSOPHERS', style: theme.textTheme.labelSmall),
              const SizedBox(height: AppSpacing.sm),
              Expanded(
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : _history.isEmpty
                        ? Center(
                            child: Text(
                              'Nothing here yet. Go pick a philosopher!',
                              style: theme.textTheme.bodyMedium,
                            ),
                          )
                        : ListView.separated(
                            itemCount: _history.length,
                            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
                            itemBuilder: (context, i) {
                              final p = _history[i];
                              return PhilosopherRow(
                                philosopher: p,
                                showQuote: true,
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
