import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

RichText richTextTitle(
        BuildContext context, String textOne, String textTwo, double size) =>
    RichText(
      text: TextSpan(
        text: textOne,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            color: const Color(0xffca3037),
            fontWeight: FontWeight.w900,
            fontFamily: "Lato",
            fontStyle: FontStyle.normal,
            fontSize: size,
          ),
        ),
        children: <TextSpan>[
          TextSpan(
            text: " ",
            style: Theme.of(context).textTheme.headline2,
          ),
          TextSpan(
            text: textTwo,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: const Color(0xff3c3f42),
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
                fontSize: size,
              ),
            ),
          ),
        ],
      ),
    );
