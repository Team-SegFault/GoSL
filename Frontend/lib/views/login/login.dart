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
                  padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                  color: Colors.white,
                  child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Enter username',
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
                          labelText: 'Enter password',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xFFBABABA))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Color(0xFFF7C04A)))),
                      obscureText: true,
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
