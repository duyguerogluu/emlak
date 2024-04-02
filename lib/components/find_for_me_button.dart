/*
 *  This file is part of emlak.
 *
 *  emlak is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  emlak is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *   along with emlak.  If not, see <https://www.gnu.org/licenses/>.
 */

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
