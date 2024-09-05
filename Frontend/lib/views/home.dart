import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui show ImageFilter;

import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(fit: StackFit.passthrough, children: [
          Image(
              image: const AssetImage("assets/images/home/kuluna.png"),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 393 * 532,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "🇱🇰",
                        style: TextStyle(fontSize: 34),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        "assets/images/GoSL_Logo.svg",
                        width: 85,
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      children: const [
                        TextSpan(
                          text: "Travelling Sri Lanka made",
                        ),
                        TextSpan(
                          text: " easier",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: () => {debugPrint("Pressed")},
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ui.ImageFilter.blur(sigmaX: 9, sigmaY: 9),
                          child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color.fromRGBO(147, 147, 147, 0.31),
                                  border:
                                      Border.all(width: 0.9, style: BorderStyle.solid, color: const Color(0x80FFFFFF))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Search a destination",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFFD9D9D9)),
                                  ),
                                  const Icon(
                                    Icons.search_outlined,
                                    color: Color(0xFFD9D9D9),
                                  )
                                ],
                              )),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ]),
        Row(children: [
          
        ],)
      ],
    );
  }
}
