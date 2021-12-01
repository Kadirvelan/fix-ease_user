import 'package:fixatease_user/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fixatease_user/utilities/constants.dart';
import 'package:fixatease_user/services/auth_helper.dart';
import 'package:fixatease_user/register_details.dart';
import 'package:fixatease_user/pick_location.dart';
import 'package:flutter/services.dart';

Widget buildEmailTF(String label, String hinttext) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: kLabelStyle,
      ),
      const SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          onChanged: (value) {
            userMail = value;
          },
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 14.0),
            prefixIcon: const Icon(
              Icons.email,
              color: Colors.white,
            ),
            hintText: hinttext,
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

Widget buildPasswordTF(String label, String hinttext) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: kLabelStyle,
      ),
      const SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          onChanged: (value) {
            print(value);
            if (label == 'Password') {
              userPass = value;
            } else {
              userPassConf = value;
            }
          },
          obscureText: true,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 14.0),
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.white,
            ),
            hintText: hinttext,
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

Widget buildForgotPasswordBtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () => print('Forgot Password Button Pressed'),
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0.0)),
      child: const Text(
        'Forgot Password?',
        style: kLabelStyle,
      ),
    ),
  );
}

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

Widget buildBtn(String btntext, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        if (btntext == 'Register') {
          signUp(context);
        } else if (btntext == 'Login') {
          signIn(context);
        } else if (btntext == 'Confirm details') {
          DatabaseMethods().adduserInfoToDB({
            "UserName": userNameController.text,
            "Latitude": markerLatLong?.latitude,
            "Longitude": markerLatLong?.longitude,
            "Address": addressController.text,
            "Mobile Number": phoneNumberController.text,
            "Alternate Mobile Number": altphoneNumberController.text,
            "Date of Birth": dateofbirth
          });
          // Navigator.pushNamed(context, "/register_details");
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shadowColor: Colors.white,
        elevation: 5.0,
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        btntext,
        style: const TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

Widget buildSignInWithText() {
  return Column(
    children: const <Widget>[
      Text(
        '- OR -',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 20.0),
      Text(
        'Sign in with',
        style: kLabelStyle,
      ),
    ],
  );
}

Widget buildSignupBtn(BuildContext context) {
  return GestureDetector(
    onTap: () => {Navigator.pushNamed(context, '/register')},
    child: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an Account?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
