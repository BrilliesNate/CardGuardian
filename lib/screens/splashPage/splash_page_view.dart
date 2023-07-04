import 'package:flutter/material.dart';
import 'package:nathan_card_app/nav_bar_page.dart';
import 'package:nathan_card_app/theme/theme_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashPageView extends StatelessWidget {
  const SplashPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeController.of(context).splashBackgroundColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: ThemeController.of(context).splashImage!.image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(150, 0, 0, 0),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: ThemeController.of(context).logo!.image,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0,35),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Securing Your \n"
                          "Transactions,",
                      style: ThemeController.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: ThemeController.of(context).primaryText,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "One Card at a time"
                      ,
                      style: ThemeController.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: ThemeController.of(context).primaryColor,
                        fontSize: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const NavBarPage();
                          }));
                        },
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:ThemeController.of(context).primaryColor!,    // Border color
                              width: 2.0,           // Border width
                            ),
                            borderRadius:
                            BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Text(
                                "Get Started Now",
                                style: ThemeController.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: ThemeController.of(context).primaryText,
                                  fontSize: 14,
                                ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.arrowRight,
                                color: ThemeController.of(context).primaryText,
                                size: 17,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
