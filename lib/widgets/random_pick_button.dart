import 'package:flutter/material.dart';

/// The "PICK A PHILOSOPHER" call-to-action on the Dashboard.
/// Data and callbacks only: the loading spin-state is owned by the caller.
class RandomPickButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const RandomPickButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            )
          : const Text('PICK A PHILOSOPHER'),
    );
  }
}
