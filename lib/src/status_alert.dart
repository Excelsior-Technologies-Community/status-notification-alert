import 'package:flutter/material.dart';
import 'package:flutter_status_notification_alert/src/status_animation.dart';
import 'package:flutter_status_notification_alert/src/status_position.dart';
import 'status_type.dart';
import 'status_style.dart';

class StatusAlert {
  static final List<AlertRequest> queue = [];
  static bool isShowing = false;

  static void show(
    BuildContext context, {
    required String text,
    required StatusType type,
    Duration duration = const Duration(seconds: 2),
    StatusPosition position = StatusPosition.top,
  }) {
    queue.add(
      AlertRequest(
        context: context,
        text: text,
        type: type,
        duration: duration,
        position: position,
      ),
    );

    processQueue();
  }

  static void processQueue() {
    if (isShowing || queue.isEmpty) return;

    isShowing = true;
    final request = queue.removeAt(0);

    showOverlay(request);
  }

  static void showOverlay(AlertRequest request) {
    final overlay = Overlay.of(request.context);
    final style = StatusStyle.getStyle(request.type);

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => AnimatedAlert(
        text: request.text,
        style: style,
        position: request.position,
        duration: request.duration,
        onDismiss: () {
          overlayEntry.remove();
          isShowing = false;
          processQueue();
        },
      ),
    );

    overlay.insert(overlayEntry);
  }
}

class AlertRequest {
  final BuildContext context;
  final String text;
  final StatusType type;
  final Duration duration;
  final StatusPosition position;

  AlertRequest({
    required this.context,
    required this.text,
    required this.type,
    required this.duration,
    required this.position,
  });
}
