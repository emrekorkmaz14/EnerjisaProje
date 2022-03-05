import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sadeneme/nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isChecked = false;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.13,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.15,
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: SvgPicture.asset("assets/logos.svg"),
                  ),
                  Text(
                    "Energy Saver",
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const TextField1(text: "İsim", htext: "İsminizi giriniz",obs: false,),
            const TextField1(
              text: "E-posta",
              htext: "E-posta adresinizi giriniz",
              obs: false,
            ),
            const TextField1(
              text: "Parola",
              htext: "Parolanızı giriniz",
              icon: Icon(Icons.visibility_off),
              inputype: TextInputType.numberWithOptions(),
              obs: true,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: MediaQuery.of(context).size.width * 0.03,
              ),
              child: Row(
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        isChecked = !isChecked;
                        setState(() {});
                      }),
                  Text(
                    "Beni hatırla",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Parolamı unuttum",
                        style: GoogleFonts.roboto(
                            color: const Color.fromARGB(255, 40, 122, 50),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const NavBar()));
                },
                child: Text(
                  "Giriş",
                  style: GoogleFonts.roboto(
                      color: Colors.white, fontWeight: FontWeight.w800),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 40, 122, 50),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.06,
              ),
              child: Text(
                "Veya",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMedia(
                  svg: SvgPicture.asset("assets/facebook.svg"),
                ),
                SocialMedia(
                  svg: SvgPicture.asset("assets/apple.svg"),
                ),
                SocialMedia(
                  svg: SvgPicture.asset("assets/google.svg"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    Key? key,
    required this.svg,
  }) : super(key: key);
  final SvgPicture svg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: MediaQuery.of(context).size.width * 0.12,
          width: MediaQuery.of(context).size.width * 0.12,
          child: svg,
        ),
      ),
    );
  }
}

class TextField1 extends StatelessWidget {
  const TextField1({
    Key? key,
    required this.text,
    this.htext,
    this.icon, this.inputype, required this.obs,
  }) : super(key: key);
  final String text;
  final String? htext;
  final Icon? icon;
  final TextInputType? inputype;
  final bool obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08,
                vertical: MediaQuery.of(context).size.width * 0.03,
              ),
              child: Text(
                text,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade200),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.width * 0.03),
            child: TextField(
              obscureText: obs,
              keyboardType: inputype,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: icon,
                suffixIconColor: Colors.black,
                hintText: htext,
                hintStyle: GoogleFonts.roboto(
                    color: Colors.grey.shade500, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
