import 'package:shared_preferences/shared_preferences.dart';

/// Persists "past philosophers" with shared_preferences, exactly as decided
/// in the proposal: a List<String> of philosopher IDs under the key
/// `pastPhilosophers`, capped at a small number (2–4) so the pool keeps
/// feeling random rather than exhausted.
///
/// This is per-device, key-value storage. No server, no SQLite: the app's
/// own data volume (roughly 1–3 picks a day) never justifies more than that.
class HistoryService {
  static const _key = 'pastPhilosophers';
  static const int maxHistory = 4;

  /// Returns the saved list of philosopher IDs, most-recent first.
  Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  /// Adds [philosopherId] to the front of history and trims to [maxHistory].
  Future<List<String>> addPick(String philosopherId) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_key) ?? [];

    // Move to front if it already exists, so "recent" stays meaningful.
    current.remove(philosopherId);
    current.insert(0, philosopherId);

    final trimmed = current.length > maxHistory
        ? current.sublist(0, maxHistory)
        : current;

    await prefs.setStringList(_key, trimmed);
    return trimmed;
  }

  /// Clears history. Not required by the proposal, but handy for a reset
  /// affordance and for testing the empty state.
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
