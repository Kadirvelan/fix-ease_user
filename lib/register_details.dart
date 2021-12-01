import 'package:fixatease_user/utilities/form_utils.dart';
import 'package:fixatease_user/pick_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fixatease_user/utilities/constants.dart';

class RegisterDetails extends StatefulWidget {
  const RegisterDetails({Key? key}) : super(key: key);

  @override
  _RegisterDetailsState createState() => _RegisterDetailsState();
}

final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController altphoneNumberController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController userNameController = TextEditingController();
DateTime dateofbirth = DateTime.now();

class _RegisterDetailsState extends State<RegisterDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addressController.text = "$markerAddress";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "User Name",
                style: kLabelStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              buildTextInput(
                  Icons.person, "Enter User Name", userNameController),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Address",
                style: kLabelStyle,
              ),
              Container(
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 80.0,
                child: TextFormField(
                  cursorHeight: 25.0,
                  controller: addressController,
                  minLines:
                      6, // any number you need (It works as the rows for the textarea)
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: kHintTextStyle,
                  decoration: kTextDecoration(
                      Icons.add_location_alt_sharp, "Enter your address"),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Mobile Number",
                style: kLabelStyle,
              ),
              const SizedBox(height: 10.0),
              buildTextInput(Icons.phone, "Enter your mobile number",
                  phoneNumberController),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Alternate Mobile Number",
                style: kLabelStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              buildTextInput(Icons.phone, 'Enter Alternate mobile number',
                  altphoneNumberController),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Date of Birth",
                style: kLabelStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  height: 80,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime(1995, 1, 1),
                    onDateTimeChanged: (DateTime newDateTime) {
                      dateofbirth = newDateTime;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              buildBtn("Confirm details", context),
            ],
          ),
        ),
      ),
    );
  }

  Container buildTextInput(
      IconData icon, String hinttext, TextEditingController controller) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: controller,
        onChanged: (value) {
          print(controller);
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          hintText: hinttext,
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
