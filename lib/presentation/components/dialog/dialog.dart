import 'package:autohouse/core/constants/font_contants.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors_contants.dart';

class DialogCustom {
  static void dialogSucess(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.check_circle,
            color: ColorsConstants.intotheGreen,
            size: 60,
          ),
          title: Text(title, style: TextStyle(fontFamily: FontConstants.inter)),
          backgroundColor: ColorsConstants.whiteSolid,
          content: Text(
            content,
            style: TextStyle(fontFamily: FontConstants.inter),
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsConstants.intotheGreen,
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        );
      },
    );
  }

  static void dialogError(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.cancel, color: Colors.red, size: 60),
          title: Text(title, style: TextStyle(fontFamily: FontConstants.inter)),
          backgroundColor: ColorsConstants.whiteSolid,
          content: Text(
            content,
            style: TextStyle(fontFamily: FontConstants.inter),
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> dialogConfirm(
    BuildContext context,
    String title,
    String content,
    Function() onPressed,
  ) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.warning, color: Colors.orange, size: 60),
          title: Text(title, style: TextStyle(fontFamily: FontConstants.inter)),
          backgroundColor: ColorsConstants.whiteSolid,
          content: Text(
            content,
            style: TextStyle(fontFamily: FontConstants.inter),
            textAlign: TextAlign.center,
          ),

          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      textStyle: const TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsConstants.intotheGreen,
                      textStyle: const TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
