import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    final double keyboardVisible = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(

                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutExpo,
                height: keyboardVisible == 0 ? height * 0.08 : height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '🇱🇰Go',
                    style: GoogleFonts.poppins(
                        fontSize: width * 0.1,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFF7C04A)),
                  ),
                  Text(
                    'SL',
                    style: GoogleFonts.poppins(
                        fontSize: width * 0.1,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFF7C04A)),
                  )
                ],
              ),
              SizedBox(height: height * 0.01),
              Container(
                alignment: Alignment.center,
                width: width * 0.5,
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'traveling Sri Lanka made ',
                    style: GoogleFonts.poppins(fontSize: width * 0.04),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'easier',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.075,
              ),
              Container(
                padding: EdgeInsets.only(
                  top: width * 0.06,
                  bottom: width * 0.035,
                  right: width * 0.06,
                  left: width * 0.06,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: ' Name',
                      labelStyle: GoogleFonts.poppins(
                        color: Color(0xFFBABABA),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFFBABABA)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFFF7C04A)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  TextField(
                    decoration: InputDecoration(
                      labelText: ' Email',
                      labelStyle: GoogleFonts.poppins(
                        color: Color(0xFFBABABA),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFFBABABA)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFFF7C04A)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  TextField(
                    decoration: InputDecoration(
                      labelText: ' Password',
                      labelStyle: GoogleFonts.poppins(
                        color: Color(0xFFBABABA),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFFBABABA)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFFF7C04A)),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: height * 0.025),
                  TextField(
                    decoration: InputDecoration(
                      labelText: ' Confirm Password',
                      labelStyle: GoogleFonts.poppins(
                        color: Color(0xFFBABABA),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFFBABABA)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFFF7C04A)),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: height * 0.03),
                  SizedBox(
                    width: double.infinity,
                    height: height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Create account');
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFFF7C04A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Text(
                        'Create Account',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text.rich(
                    TextSpan(
                      text: 'Read our ',
                      style: GoogleFonts.poppins(
                        fontSize: width * 0.025,
                        color: Color(0xFFBABABA),
                      ),
                      children: [
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Privacy Policy clicked');
                            },
                        ),
                        TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: 'Terms of Use',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Terms of Use clicked');
                            },
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(height: height * 0.02), // Responsive space
              ElevatedButton.icon(
                icon: Image.asset('assets/icons/google.png', height: 20.0),
                label: const Text('Sign in with Google'),
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  minimumSize: Size(width*0.6, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(
                    color: Color(0xFFE8E8E8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: Icon(Icons.facebook, color: Colors.white),
                label: const Text('Sign in with Facebook'),
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF1877F2),
                  minimumSize: Size(width*0.6, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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
