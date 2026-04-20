import 'package:flutter/material.dart';
import 'status_type.dart';

class StatusStyle {
  final Color color;
  final IconData icon;

  StatusStyle({required this.color, required this.icon});

  static StatusStyle getStyle(StatusType type) {
    switch (type) {
      case StatusType.success:
        return StatusStyle(color: Colors.green, icon: Icons.check_circle);
      case StatusType.error:
        return StatusStyle(color: Colors.red, icon: Icons.error);
      case StatusType.warning:
        return StatusStyle(color: Colors.orange, icon: Icons.warning);
      case StatusType.info:
        return StatusStyle(color: Colors.blue, icon: Icons.info);
    }
  }
}