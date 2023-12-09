import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int duration;
  final void Function(int timeRemaining) onTimerCompletion;

  const CountdownTimer({
    super.key,
    required this.duration,
    required this.onTimerCompletion,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _remainingMinutes;
  late int _remainingSeconds;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remainingMinutes = widget.duration;
    _remainingSeconds = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTimer(Timer timer) {
    if (_remainingMinutes == 0 && _remainingSeconds == 0) {
      _timer.cancel();
      widget.onTimerCompletion(_remainingMinutes);
    } else {
      setState(() {
        if (_remainingSeconds == 0) {
          _remainingMinutes--;
          _remainingSeconds = 59;
        } else {
          _remainingSeconds--;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_remainingMinutes : $_remainingSeconds',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
