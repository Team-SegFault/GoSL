import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                ), // to do - hero should be added
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '🇱🇰Go',
                      style: GoogleFonts.poppins(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFF7C04A)),
                    ),
                    Text(
                      'SL',
                      style: GoogleFonts.poppins(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFF7C04A)),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Container(
                    alignment: Alignment.center,
                    width: 200,
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'traveling Sri Lanka made ', // Regular text
                        style: GoogleFonts.poppins(
                            fontSize:
                                16), // Apply a font style for the entire text
                        children: <TextSpan>[
                          TextSpan(
                            text: 'easier', // Bold last word
                            style: GoogleFonts.poppins(
                              fontWeight:
                                  FontWeight.bold, // Make only this word bold
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 80,
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                          labelText: ' Username',
                          labelStyle: GoogleFonts.poppins(color: Color(0xFFBABABA),),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFFBABABA))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Color(0xFFF7C04A)))),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                          labelText: ' Password',
                          labelStyle: GoogleFonts.poppins(color: Color(0xFFBABABA),),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFFBABABA))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Color(0xFFF7C04A)))),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // Handle click event here
                          print('Text clicked');
                        },
                      child: Text(
                        'Forget Password',
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(
                            color: Color(0xFFBABABA), fontSize: 12),
                      ),)
                    ),
                    Container(
                      height: 10,
                    ),
                    SizedBox(
                        width: 450,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {print('Login');},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xFFF7C04A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                                color: Colors.black, // Set text color here
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.w500 // Set font size if needed
                                ),
                          ),
                        )),
                    Container(
                      height: 10,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Read our ', // Normal text
                        style: GoogleFonts.poppins(fontSize: 10,color: Color(0xFFBABABA)),
                        children: [
                          TextSpan(
                            text: 'Privacy Policy', // Clickable and underlined
                            style: TextStyle(
                              decoration:
                                  TextDecoration.underline, // Underline text
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle Privacy Policy click
                                print('Privacy Policy clicked');
                              },
                          ),
                          TextSpan(
                            text: ' and ', // Normal text
                          ),
                          TextSpan(
                            text: 'Terms of Use', // Clickable and underlined
                            style: TextStyle(
                              decoration:
                                  TextDecoration.underline, // Underline text
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle Terms of Use click
                                print('Terms of Use clicked');
                              },
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
