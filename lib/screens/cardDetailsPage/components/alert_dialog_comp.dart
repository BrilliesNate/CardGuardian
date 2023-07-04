import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nathan_card_app/theme/theme_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AlertDialogComp extends StatefulWidget {
  final int? errorCode;

  const AlertDialogComp({Key? key, required this.errorCode}) : super(key: key);

  @override
  State<AlertDialogComp> createState() => _AlertDialogCompState();
}

class _AlertDialogCompState extends State<AlertDialogComp> {
  String title = "Back Online Soon!";
  String description = "Hold tight! mypower24 is undergoing some maintenance.";
  var cardLable;

  bool isInit = false;
  initCard(context) {

    if(!isInit) {
      isInit = true;
      switch (widget.errorCode) {
        case 100:
          {
            title = "Card already saved";
            description =
            "Please make sure you add a card that has not been added before";
            cardLable = Lottie.asset('assets/lottie_animations/cardAlreadySaved.json');

            // statements;
          }
          break;

        case 101:
          {
            title = "Card Banned!";
            description = "This Card has been banned in the following countries __remeber to add countries__";
            cardLable = Lottie.asset('assets/lottie_animations/warning.json');
            // cardLable = Image.asset(
            //   'assets/images/errorPage.png',
            //   width: 240,
            //   height: 170,
            //   fit: BoxFit.fitHeight,
            // );

            //statements;
          }
          break;
        case 69:
          {
            title = "No Chart Data!";
            description =
            "Please select another date";
            cardLable = Lottie.asset('assets/lottie_animations/loginBtn.json');
            //statements;
          }

          break;

        case 1000:
          {
            title = "No Logger";
            description =
            "Please contact support to add a logger to your account";
            cardLable = Lottie.asset('assets/lottie_animations/loginBtn.json');
            //statements;
          }

          break;

        default:
          {
            //statements;
          }
          break;
      }
    }


  }

  @override
  Widget build(BuildContext context) {
    initCard(context);
    return AlertDialog(
      backgroundColor: ThemeController.of(context).primaryBackground,
      // Text('Login unsuccessful'),
      title: Center(
        child: Text(
          title,
          style: ThemeController.of(context).bodyText1,
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: ThemeController.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  color: ThemeController.of(context).secondaryText,
                ),
              ),
            ),
            Center(
              child: cardLable,
            ),
            // Padding(
            //   padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            //   child: Text(
            //     'Error code: $errorCode',
            //     style: FlutterFlowTheme.of(context).bodyText1.override(
            //       fontFamily: 'Poppins',
            //       color: FlutterFlowTheme.of(context).secondaryText,
            //     ),
            //   ),
            // ),

            // Text('Would you like to approve of this message?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
