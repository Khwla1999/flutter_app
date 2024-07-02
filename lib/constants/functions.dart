import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';

Widget splashIcon(
  String localImagePath, {
  double? imageSize,
  Color? backgroundColor,
  int? durationInMilliseconds,
  Widget? nextScreen,
}) =>
    FlutterSplashScreen.fadeIn(
      backgroundColor: backgroundColor ?? Colors.white,
      duration: Duration(milliseconds: durationInMilliseconds ?? 1500),
      childWidget: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage(localImagePath),
          radius: imageSize ?? 80.0,
        ),
      ),
      nextScreen: nextScreen,
    );
dynamic successSnackBar(
  BuildContext context, {
  String? message,
  DismissDirection? direction,
  Duration? duration,
}) {
  return IconSnackBar.show(
    context,
    direction: direction,
    duration: duration,
    snackBarStyle: const SnackBarStyle(backgroundColor: Colors.blueAccent),
    snackBarType: SnackBarType.success,
    label: message ?? 'Save successfully',
  );
}

dynamic failedSnackBar(
  BuildContext context, {
  String? message,
  DismissDirection? direction,
  Duration? duration,
}) {
  return IconSnackBar.show(
    context,
    direction: direction,
    duration: duration,
    snackBarStyle: const SnackBarStyle(backgroundColor: Colors.blueAccent),
    snackBarType: SnackBarType.fail,
    label: message ?? 'Save successfully',
  );
}
