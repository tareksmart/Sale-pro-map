import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_pro_map_app/utilities/routes.dart';
import 'package:sales_pro_map_app/widgets/bottom_navBar.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
      final snackbar = MySnackbar(message: 'Please input user name');
    return Scaffold(
      key: scaffolKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: FirebaseUIActions(
                  actions: [
                    AuthStateChangeAction<SignedIn>((context, state) {
                      if (state.user!.displayName != null) {
                        Navigator.pushNamed(context, AppRoutes.homePage);
                      } else {
                        
                        Navigator.pushNamed(context, AppRoutes.profile);
                       scaffolKey.currentState!
                            .showBottomSheet((context) => snackbar);
                       
                      }
                    })
                  ],
                  child: LoginView(
                    action: AuthAction.signIn,
                    providers: FirebaseUIAuth.providersFor(
                      FirebaseAuth.instance.app,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
