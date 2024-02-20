import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sudoku/src/core/theme/app_theme.dart';

class StopwatchText extends StatefulWidget {
  final Stopwatch stopwatch;
  final TextStyle? textStyle;

  const StopwatchText({super.key, required this.stopwatch, this.textStyle});

  @override
  State<StopwatchText> createState() => _StopwatchTextState();
}

class _StopwatchTextState extends State<StopwatchText> {
  late Timer _timer;

  _StopwatchTextState() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), _callback);
  }
  @override
  void didUpdateWidget(covariant StopwatchText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_timer.isActive && widget.stopwatch.isRunning) {
      _timer = Timer.periodic(const Duration(milliseconds: 30), _callback);
    }
  }

  void _callback(Timer timer) {
    if (widget.stopwatch.isRunning) {
      setState(() {});
    } else {
      _timer.cancel();
    }
  }

  String get formattedStopwatchText {
    final date = DateTime.fromMillisecondsSinceEpoch(widget.stopwatch.elapsedMilliseconds);
    return date.hour >= 1 ? DateFormat('HH:mm:ss').format(date) : DateFormat('mm:ss').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formattedStopwatchText,
      style: AppTheme.actualTheme(context).stopwatch,
    );
  }
}
