import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

showLoadingDialog(BuildContext context, String message) => showDialog(
      barrierDismissible: false,
      barrierColor: Colors.grey.withOpacity(0.4),
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.all(12),
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message, style: const TextStyle(fontSize: 17)),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.transparent,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

Future<dynamic> checkDialog([
  context,
  String message = '',
  String title = '',
]) =>
    CoolAlert.show(
        context: context,
        type: CoolAlertType.custom,
        barrierDismissible: true,
        showCancelBtn: true,
        confirmBtnText: 'Yes',
        title: (title != '') ? title : '',
        widget: Text(
          message,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        closeOnConfirmBtnTap: true,
        backgroundColor: Colors.white,
        confirmBtnColor: Colors.white,
        confirmBtnTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
        ),
        lottieAsset: 'assets/warning.json',
        loopAnimation: false,
        onConfirmBtnTap: () {
          exit(0);
        });
