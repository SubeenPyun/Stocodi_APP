import 'package:flutter/material.dart';

class ChartNameColumn extends StatefulWidget {
  const ChartNameColumn({super.key});

  @override
  _ChartNameColumnState createState() => _ChartNameColumnState();
}

class _ChartNameColumnState extends State<ChartNameColumn> {
  bool isLiked = false; // Initial state

  void toggleLike() {
    setState(() {
      isLiked = !isLiked; // Toggle the state
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double fontSize;
    if (screenWidth < 600) {
      // Adjust font size for smaller screens
      fontSize = 20.0;
    } else {
      fontSize = 25.0;
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(Icons.chevron_left, size: 30),
          SizedBox(width: 16),
          Text(
            '삼성전자',
            style: TextStyle(fontSize: fontSize),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.green : Colors.black,
              size: 30,
            ),
            onPressed: toggleLike,
          ),
        ],
      ),
    );
  }
}
