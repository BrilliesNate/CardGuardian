import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/card_detials_controller.dart';
import '../../../theme/theme_controller.dart';

class ValidateBtn extends StatelessWidget {
  const ValidateBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cController = Provider.of<CardDetailsController>(context);
    return InkWell(
      onTap: () {
      cController.inferCardType(context);

        // cController.saveTest("4123123412341234", '1010', 'Nathan', '123', "Visa", "South Africa");
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 30),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            border: Border.all(
              color:ThemeController.of(context).primaryColor!,    // Border color
              width: 1.0,           // Border width
            ),
            borderRadius:
            BorderRadius.circular(8),
          ),
        child: Center(
          child: Text(
            "Submit",
            style: ThemeController.of(context)
                .bodyText1
                .override(
              fontFamily: 'Poppins',
              color:
              ThemeController.of(context)
                  .primaryText,
              fontSize: 14,
            ),
          ),
        ),
        ),
      ),
    );
  }
}
