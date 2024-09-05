import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200,), // to do - hero should be added
                Row(
                  children: [
                    Text(
                      '🇱🇰 Go',
                      style: GoogleFonts.poppins(fontSize: 40),
                    ),
                    Text('SL',
                    style: GoogleFonts.poppins(fontSize: 40,fontWeight:FontWeight.w700),)
                  ],
                ),
                SizedBox(height: 20),
                Text('traveing Sri Lanka made easier'),
                SizedBox(height: 40,),
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