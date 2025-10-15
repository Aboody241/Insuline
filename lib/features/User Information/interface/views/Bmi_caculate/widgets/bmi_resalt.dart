import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/on_board_style.dart';

class BmiReasault extends StatelessWidget {
  final String resault;
  final String status;
  const BmiReasault({super.key, required this.resault, required this.status});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "overweight":
        return Colors.red;        // الوزن زايد
      case "normal":
        return Colors.yellow[700]!; // عادي
      case "healthy":
        return Colors.green;      // صحي
      case "obese":
        return Colors.deepOrange; // سمنة
      default:
        return Colors.grey;       // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            resault,
            style: OnBoardStyle.onBoardTitle.copyWith(fontSize: 20),
          ),
          Text(
            status,
            style: OnBoardStyle.onBoardTitle.copyWith(
              fontSize: 20,
              color: _getStatusColor(status),
            ),
          ),
        ],
      ),
    );
  }
}
