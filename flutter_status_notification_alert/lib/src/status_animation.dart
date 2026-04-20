import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_status_notification_alert/src/status_position.dart';
import 'package:flutter_status_notification_alert/src/status_style.dart';

class AnimatedAlert extends StatefulWidget {
  final String text;
  final StatusStyle style;
  final StatusPosition position;
  final VoidCallback onDismiss;
  final Duration duration;

  const AnimatedAlert({
    super.key,
    required this.text,
    required this.style,
    required this.position,
    required this.onDismiss,
    required this.duration,
  });

  @override
  State<AnimatedAlert> createState() => _AnimatedAlertState();
}

class _AnimatedAlertState extends State<AnimatedAlert>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  bool _dismissed = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    final begin = widget.position == StatusPosition.top
        ? const Offset(0, -1)
        : const Offset(0, 1);

    _animation = Tween(
      begin: begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    _timer = Timer(widget.duration, _dismiss);
  }

  void _dismiss() async {
    if (_dismissed) return;
    _dismissed = true;

    _timer?.cancel();

    await _controller.reverse();
    if (mounted) widget.onDismiss();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.position == StatusPosition.top ? 60 : null,
      bottom: widget.position == StatusPosition.bottom ? 60 : null,
      left: 20,
      right: 20,
      child: SlideTransition(
        position: _animation,
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.horizontal,
          onDismissed: (_) => _dismiss(),
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: widget.style.color,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 6),
                ],
              ),
              child: Row(
                children: [
                  Icon(widget.style.icon, color: Colors.white),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
