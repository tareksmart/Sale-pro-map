import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_pro_map_app/utilities/routes.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: FirebaseUIActions(actions: [AuthStateChangeAction<SignedIn>((context, state) { 
                     if (!state.user!.emailVerified) {
                        Navigator.pushNamed(context, AppRoutes.verifyEmail);
                      } else {
                        Navigator.pushReplacementNamed(context, AppRoutes.homePage);
                      }
                })],
                child: LoginView(
                
                    action: AuthAction.signIn,
                    providers: FirebaseUIAuth.providersFor(
                      FirebaseAuth.instance.app,
                    ),
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
