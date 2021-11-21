import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utilities/constants.dart';
import 'utilities/form_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/SplashScreen2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Container(
              //   height: double.infinity,
              //   width: double.infinity,
              //   decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [
              //         Color(0xFF73AEF5),
              //         Color(0xFF61A4F1),
              //         Color(0xFF478DE0),
              //         Color(0xFF398AE5),
              //       ],
              //       stops: [0.1, 0.4, 0.7, 0.9],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 110.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.withOpacity(0.2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        buildEmailTF('Email', 'Enter your Email'),
                        const SizedBox(
                          height: 35.0,
                        ),
                        buildPasswordTF('Password', 'Enter your password'),
                        const SizedBox(
                          height: 35.0,
                        ),
                        buildPasswordTF(
                            'Confirm Password', 'Re-Enter your password'),
                        // _buildForgotPasswordBtn(),
                        // _buildRememberMeCheckbox(),
                        buildBtn('Register', context),
                        // _buildSignInWithText(),
                      ],
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
