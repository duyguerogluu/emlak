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