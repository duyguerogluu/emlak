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

void showLoadingAppLogoDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: _getDialog,
    );

Widget _getDialog(BuildContext context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _getLoadingAppLogo(
                progressColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        );

Widget _getLoadingAppLogo({
  required Color progressColor,
  double containerSize = 64,
}) =>
    RepaintBoundary(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: containerSize,
            height: containerSize,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(progressColor),
            ),
          ),
        ],
      ),
    );