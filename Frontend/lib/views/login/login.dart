import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  child: Text(
                    'traveing Sri Lanka made easier',
                    style: GoogleFonts.poppins(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  padding: EdgeInsets.only(left: 25,right: 25,top: 25,bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                          labelText: ' Username',
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
                      child: Text(
                        'Forget Password',
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(color: Color(0xFFBABABA),fontSize: 12),
                      ),
                    ),
                    Container(height: 10,),
                    SizedBox(
                      width: 450,
                        height: 50,
                        child:ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFFF7C04A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Text('Login',
                        style: GoogleFonts.poppins(
                          color: Colors.black, // Set text color here
                          fontSize: 16,
                          fontWeight: FontWeight.w500// Set font size if needed
                        ),
                      ),
                    )),
                    Container(height: 10,),
                    Text(
                      'Read our Privacy Policy and Terms of Use',
                      textAlign: TextAlign.end,
                      style: GoogleFonts.poppins(color: Color(0xFFBABABA),fontSize: 10),
                    ),
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
