import 'package:GOSL/components/home_card.dart';
import 'package:GOSL/views/visa_application/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui show ImageFilter;

import '../components/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEEEEEE),
      child: ListView(
        children: [
          const CoverPhoto(),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCard(
                  title: "Explore",
                  imgPath: "assets/images/home/sigiriya_blur.png",
                ),
                Spacer(),
                HomeCard(
                  title: "Plan Trip",
                  imgPath: "assets/images/home/trip_blur.png",
                ),
              ],
            ),
          ),
          const VisaSimplified(),
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Locations",
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w500)),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      debugPrint("See More Pressed");
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                      child: Text("See More",
                          style: GoogleFonts.inter(
                              fontSize: 13, color: const Color(0x70000000))),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CoverPhoto extends StatelessWidget {
  const CoverPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.passthrough, children: [
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 18),
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
                              border: Border.all(
                                  width: 0.9,
                                  style: BorderStyle.solid,
                                  color: const Color(0x80FFFFFF))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Search a destination",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFD9D9D9)),
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
    ]);
  }
}

class VisaSimplified extends StatelessWidget {
  const VisaSimplified({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              text: "Visa ",
              children: const [
                TextSpan(
                  text: "simplified",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          Text(
            "You can now apply for Visa to Sri Lanka right within the GoSL App. No more hassle of visiting embassies or waiting in long queues.",
            softWrap: true,
            style: GoogleFonts.poppins(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          const Gap(8),
          const SizedBox(
              width: double.infinity,
              child: AppButton(
                text: "Apply Visa",
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VisaApplicationPage(),
                  ))
                },
              )),
        ],
      ),
    );
  }
}