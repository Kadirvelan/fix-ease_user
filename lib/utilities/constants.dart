import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kHintTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
);

InputDecoration kTextDecoration(IconData icon, String hinttext) {
  return InputDecoration(
    border: InputBorder.none,
    contentPadding: const EdgeInsets.only(top: 5.0),
    prefixIcon: Icon(
      icon,
      color: Colors.white,
    ),
    hintText: hinttext,
    hintStyle: kHintTextStyle,
  );
}

const kLabelStyle = TextStyle(
  color: Colors.black,
  fontSize: 21.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kButtonText = GoogleFonts.roboto(
  textStyle:
      const TextStyle(color: Colors.white, letterSpacing: .5, fontSize: 20.0),
);

final kButtonStyle = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.fromLTRB(20, 12, 20, 12)),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            side: BorderSide(color: Colors.white))));
