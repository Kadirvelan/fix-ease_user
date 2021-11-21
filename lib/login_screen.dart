import 'package:fixatease_user/services/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utilities/constants.dart';
import 'utilities/form_utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  // Widget _buildEmailTF() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       const Text(
  //         'Email',
  //         style: kLabelStyle,
  //       ),
  //       const SizedBox(height: 10.0),
  //       Container(
  //         alignment: Alignment.centerLeft,
  //         decoration: kBoxDecorationStyle,
  //         height: 60.0,
  //         child: TextField(
  //           onChanged: (value) {
  //             userMail = value;
  //           },
  //           keyboardType: TextInputType.emailAddress,
  //           style: const TextStyle(
  //             color: Colors.white,
  //             fontFamily: 'OpenSans',
  //           ),
  //           decoration: const InputDecoration(
  //             border: InputBorder.none,
  //             contentPadding: EdgeInsets.only(top: 14.0),
  //             prefixIcon: Icon(
  //               Icons.email,
  //               color: Colors.white,
  //             ),
  //             hintText: 'Enter your Email',
  //             hintStyle: kHintTextStyle,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget _buildPasswordTF() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       const Text(
  //         'Password',
  //         style: kLabelStyle,
  //       ),
  //       const SizedBox(height: 10.0),
  //       Container(
  //         alignment: Alignment.centerLeft,
  //         decoration: kBoxDecorationStyle,
  //         height: 60.0,
  //         child: const TextField(
  //           obscureText: true,
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontFamily: 'OpenSans',
  //           ),
  //           decoration: InputDecoration(
  //             border: InputBorder.none,
  //             contentPadding: EdgeInsets.only(top: 14.0),
  //             prefixIcon: Icon(
  //               Icons.lock,
  //               color: Colors.white,
  //             ),
  //             hintText: 'Enter your Password',
  //             hintStyle: kHintTextStyle,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget _buildForgotPasswordBtn() {
  //   return Container(
  //     alignment: Alignment.centerRight,
  //     child: TextButton(
  //       onPressed: () => print('Forgot Password Button Pressed'),
  //       style: TextButton.styleFrom(padding: const EdgeInsets.all(0.0)),
  //       child: const Text(
  //         'Forgot Password?',
  //         style: kLabelStyle,
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildRememberMeCheckbox() {
  //   return SizedBox(
  //     height: 20.0,
  //     child: Row(
  //       children: <Widget>[
  //         Theme(
  //           data: ThemeData(unselectedWidgetColor: Colors.white),
  //           child: Checkbox(
  //             value: _rememberMe,
  //             checkColor: Colors.green,
  //             activeColor: Colors.white,
  //             onChanged: (value) {
  //               setState(() {
  //                 _rememberMe = value!;
  //               });
  //             },
  //           ),
  //         ),
  //         const Text(
  //           'Remember me',
  //           style: kLabelStyle,
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildLoginBtn() {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(vertical: 25.0),
  //     width: double.infinity,
  //     child: ElevatedButton(
  //       onPressed: () async {
  //         try {
  //           UserCredential userCredential = await FirebaseAuth.instance
  //               .signInWithEmailAndPassword(
  //                   email: userMail, password: userPass);
  //           if (userCredential != null) {
  //             await Navigator.pushNamed(context, '/chatroom');
  //           }
  //         } on FirebaseAuthException catch (e) {
  //           if (e.code == 'user-not-found') {
  //             print('No user found for that email.');
  //           } else if (e.code == 'wrong-password') {
  //             print('Wrong password provided for that user.');
  //           }
  //         }
  //       },
  //       style: ElevatedButton.styleFrom(
  //         primary: Colors.white,
  //         shadowColor: Colors.white,
  //         elevation: 5.0,
  //         padding: const EdgeInsets.all(15.0),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(30.0),
  //         ),
  //       ),
  //       child: const Text(
  //         'LOGIN',
  //         style: TextStyle(
  //           color: Color(0xFF527DAA),
  //           letterSpacing: 1.5,
  //           fontSize: 18.0,
  //           fontWeight: FontWeight.bold,
  //           fontFamily: 'OpenSans',
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildSignInWithText() {
  //   return Column(
  //     children: const <Widget>[
  //       Text(
  //         '- OR -',
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontWeight: FontWeight.w400,
  //         ),
  //       ),
  //       SizedBox(height: 20.0),
  //       Text(
  //         'Sign in with',
  //         style: kLabelStyle,
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget _buildSignupBtn() {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.pushNamed(context, '/register');
  //     },
  //     child: RichText(
  //       text: const TextSpan(
  //         children: [
  //           TextSpan(
  //             text: 'Don\'t have an Account?',
  //             style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 18.0,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //           TextSpan(
  //             text: 'Sign Up',
  //             style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 18.0,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        buildEmailTF('Email', 'Enter your email'),
                        const SizedBox(
                          height: 30.0,
                        ),
                        buildPasswordTF('Password', 'Enter your password'),
                        // _buildForgotPasswordBtn(),
                        // _buildRememberMeCheckbox(),
                        buildBtn('Login', context),
                        // _buildSignInWithText(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        buildSignupBtn(context),
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
