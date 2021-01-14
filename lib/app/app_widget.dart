import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/shared/colors/custom_colors.dart';
import 'package:todo/app/shared/dimens/custom_dimens.dart';

class AppWidget extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Text("Ops, something is wrong"),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            navigatorKey: Modular.navigatorKey,
            title: 'Flutter Slidy',
            theme: ThemeData(
              primarySwatch: CustomColors.primarySwatch,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(CustomDimens.defaultPadding),
                  primary: CustomColors.primaryButtonColor,
                  textStyle: TextStyle(
                    color: CustomColors.buttonColorTextDefault,
                    fontSize: CustomDimens.defaultButtonFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        CustomDimens.defaultButtonCornerRadius,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            initialRoute: '/',
            onGenerateRoute: Modular.generateRoute,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
