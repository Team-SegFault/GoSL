import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
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
                      '🇱🇰 Go',
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
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  width: 400,
                  child: Text(
                    'traveing Sri Lanka made easier',
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Username',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
