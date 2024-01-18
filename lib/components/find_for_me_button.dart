import 'package:flutter/material.dart';

Widget _getFindForMeButton({
  required IconData icon,
  required String label,
  required VoidCallback onPressed,
}) {
  return Flexible(
    child: InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 100,
        width: 200,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(icon, size: 36.0, color: Colors.black54),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
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
