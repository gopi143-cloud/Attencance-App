import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
//import 'package:myapp/page-1/add-fingerprint.dart';
import 'package:myapp/page-1/configurations.dart';
import 'package:flutter/material.dart'; // Import the material library for dialogs
import 'package:http/http.dart' as http;
import 'package:myapp/page-1/student-main-portal-uc.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}
class _RegistrationState extends State<Registration> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isNotValidateEmail = false;
  bool _isNotValidatePassword = false;

void Slogin() async {
  // Check if username and password are not empty
  if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
    // Prepare request body with username and password
    String userID = usernameController.text;
    String password = passwordController.text;

    try {
      Uri studentLoginUri = Uri.parse(StudentLoginRouters);
      // Send POST request to the server
      var response = await http.post(
        studentLoginUri, // Replace 'uri' with your actual server endpoint
        body: json.encode({'UserID': userID, 'Password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      // Handle response
      if (response.statusCode == 200) {
        // Parse the response JSON
        var responseData = json.decode(response.body);
        String registerNumber = responseData['student']['RegisterNumber'];
 // Extract register number from response
        // Save user credentials and register number to shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userID', userID);
        prefs.setString('password', password);
        prefs.setString('registerNumber', registerNumber);
        // Navigate to the next screen
        /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddFingerprint()),
        );*/
        Navigator.push(
                      context,
                        MaterialPageRoute(builder: (context) => StudentMainPortalUC()),
                    );
        UserData.loadData();
      } else {
        // Show popup for wrong password/username
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Wrong Password/Username'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Error occurred while sending request
      // Handle error here
    }
  } else {
    // Username or password is empty
    setState(() {
      _isNotValidateEmail = true;
      _isNotValidatePassword = true;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    double baseWidth = 396;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // studentloginLFH (1:396)
        width: double.infinity,
        height: 844*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Container(
          // depth0frame1V8B (2:489)
          padding: EdgeInsets.fromLTRB(0*fem, 25*fem, 0*fem, 26*fem),
          width: 390*fem,
          height: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xfff2f7f2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // frame3PjM (24:41)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 85*fem, 323*fem),
                width: 265*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // autogroupcdybuBu (RVywqLPD52ND49VrU1CDYB)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 76*fem, 3*fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // cqLT (24:42)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                            child: Text(
                              'C',
                              style: SafeGoogleFont (
                                'Plus Jakarta Sans',
                                fontSize: 128*ffem,
                                fontWeight: FontWeight.w700,
                                height: 0.17578125*ffem/fem,
                                letterSpacing: -0.2700000107*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // laM3u (25:77)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19*fem),
                            child: Text(
                              'lass',
                              style: SafeGoogleFont (
                                'Plus Jakarta Sans',
                                fontSize: 48*ffem,
                                fontWeight: FontWeight.w700,
                                height: 0.46875*ffem/fem,
                                letterSpacing: -0.2700000107*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      // onnect4DD (25:80)
                      'onnect',
                      style: SafeGoogleFont (
                        'Plus Jakarta Sans',
                        fontSize: 48*ffem,
                        fontWeight: FontWeight.w700,
                        height: 0.46875*ffem/fem,
                        letterSpacing: -0.2700000107*fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // depth1frame0CKR (2:526)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 12*fem),
                padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 16*fem, 8*fem),
                width: 366*fem,
                height: 72*fem,
                decoration: BoxDecoration (
                  color: Color(0xfff2f7f2),
                ),
                child: Container(
                  // autogroupmwfhtxw (RVyxKzE8gt13AAg63BMWfh)
                  padding: EdgeInsets.fromLTRB(0*fem, 12*fem, 0*fem, 12*fem),
                  width: 286*fem,
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // depth3frame0Rhy (2:528)
                        width: 24*fem,
                        height: 24*fem,
                        child: Image.asset(
                          'assets/page-1/images/depth-3-frame-0-vuV.png',
                          width: 24*fem,
                          height: 24*fem,
                        ),
                      ),
                      Container(
                        // depth3frame1ZJP (2:533)
                        margin: EdgeInsets.fromLTRB(0*fem, 0.75*fem, 0*fem, 0.75*fem),
                        width: 262*fem,
                        height: double.infinity,
                        decoration: BoxDecoration (
                        ),
                        child: Container(
                          // depth4frame04kw (2:534)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 139.11*fem, 0*fem),
                          width: 122.89*fem,
                          height: double.infinity,
                          child: Text(
                            'Student Login',
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.25*ffem/fem,
                              letterSpacing: -0.2700000107*fem,
                              color: Color(0xff0c1c0f),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // depth3frame0xLX (2:514)
                margin: EdgeInsets.fromLTRB(16*fem, 0*fem, 16*fem, 33*fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // usernameGs1 (2:516)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                      child: Text(
                        'Username',
                        style: SafeGoogleFont (
                          'Plus Jakarta Sans',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: Color(0xff0c1c0f),
                        ),
                      ),
                    ),
                    Container(
                      // depth5frame0CEs (2:518)
                      padding: EdgeInsets.fromLTRB(15*fem, 15*fem, 15*fem, 17*fem),
                      width: double.infinity,
                      height: 56*fem,
                      decoration: BoxDecoration (
                        border: Border.all(color: Color(0xffcce5d1)),
                        color: Color(0xfff2f7f2),
                        borderRadius: BorderRadius.circular(12*fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // depth6frame06b9 (2:519)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                            width: 288*fem,
                            height: double.infinity,
                            child: TextField(
                              controller: usernameController,
                              decoration: InputDecoration (
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                errorText: _isNotValidateEmail ? "Enter Valid Username" : null,
                                disabledBorder: InputBorder.none,
                                hintText: 'Enter your username                                                 ',
                                hintStyle: TextStyle(color:Color(0xff4c937f)),
                              ),
                              style: SafeGoogleFont (
                                'Plus Jakarta Sans',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // depth6frame1amD (2:522)
                            width: 24*fem,
                            height: 24*fem,
                            child: Image.asset(
                              'assets/page-1/images/depth-6-frame-1-GG7.png',
                              width: 24*fem,
                              height: 24*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // depth3frame0Wes (2:500)
                margin: EdgeInsets.fromLTRB(16*fem, 0*fem, 16*fem, 16*fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // passwordSYX (2:502)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                      child: Text(
                        'Password',
                        style: SafeGoogleFont (
                          'Plus Jakarta Sans',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: Color(0xff0c1c0f),
                        ),
                      ),
                    ),
                    Container(
                      // depth5frame0NBH (2:504)
                      padding: EdgeInsets.fromLTRB(15*fem, 15*fem, 15*fem, 17*fem),
                      width: double.infinity,
                      height: 56*fem,
                      decoration: BoxDecoration (
                        border: Border.all(color: Color(0xffcce5d1)),
                        color: Color(0xfff2f7f2),
                        borderRadius: BorderRadius.circular(12*fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // depth6frame0gSs (2:505)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 27*fem, 0*fem),
                            width: 277*fem,
                            height: double.infinity,
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration (
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                errorText: _isNotValidatePassword ? "Enter Valid Password" : null,
                                hintText: 'Enter your password                                             ',
                                hintStyle: TextStyle(color:Color(0xff4c937f)),
                              ),
                              style: SafeGoogleFont (
                                'Plus Jakarta Sans',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // depth6frame1Yjy (2:508)
                            width: 24*fem,
                            height: 24*fem,
                            child: Image.asset(
                              'assets/page-1/images/depth-6-frame-1-Lkw.png',
                              width: 24*fem,
                              height: 24*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // forgotpassword5ju (2:497)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 24*fem),
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont (
                    'Plus Jakarta Sans',
                    fontSize: 14*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5*ffem/fem,
                    color: Color(0xff4c937f),
                  ),
                ),
              ),
              Container(
                // depth2frame0nPR (2:491)
                margin: EdgeInsets.fromLTRB(16*fem, 0*fem, 16*fem, 0*fem),
                child: TextButton(
                  onPressed: () {          
                    Slogin();
                  },
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(156.84*fem, 12*fem, 156.84*fem, 12*fem),
                    width: double.infinity,
                    height: 48*fem,
                    decoration: BoxDecoration (
                      color: Color(0xff7fd8be),
                      borderRadius: BorderRadius.circular(24*fem),
                    ),
                    child: Container(
                      // depth3frame0TkT (2:492)
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration (
                        color: Color(0xff7fd8be),
                      ),
                      child: Text(
                        'Login',
                        style: SafeGoogleFont (
                          'Plus Jakarta Sans',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.5*ffem/fem,
                          letterSpacing: 0.2399999946*fem,
                          color: Color(0xff0c1c0f),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
          );
  }
}
class StudentLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Registration();
  }
}