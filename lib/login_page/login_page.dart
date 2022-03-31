import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sadeneme/nav_bar.dart';
import 'package:sadeneme/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isChecked = false;

class _LoginPageState extends State<LoginPage> {
  late final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.06,
                  bottom: MediaQuery.of(context).size.width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.37,
                    width: MediaQuery.of(context).size.width * 0.37,
                    child: SvgPicture.asset("assets/logos.svg"),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Energy Saver",
                    style: GoogleFonts.roboto(
                        color: Colors.grey.shade800,
                        fontSize: MediaQuery.of(context).size.height * 0.028,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            TextField1(
              controller: myController2,
              text: "İsim",
              htext: "İsminizi giriniz",
              obs: false,
            ),
            TextField1(
              controller: myController,
              text: "E-posta",
              htext: "E-posta adresinizi giriniz",
              obs: false,
            ),
            TextField1(
              controller: myController1,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            isChecked = !isChecked;
                            setState(() {});
                          }),
                      Text(
                        "Remember me",
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot my password",
                      style: GoogleFonts.roboto(
                          color: const Color.fromARGB(255, 40, 122, 50),
                          fontWeight: FontWeight.bold),
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
                  if (myController != null && myController1 != null) {
                    MyAuthService().registerWithMail(
                        mail: myController.text, password: myController1.text);
                  } else {
                    print(
                        "Bir hata oluştu. email : $myController password: $myController1");
                  }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const NavBar()));
                },
                child: Text(
                  "LOG IN",
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
                "or",
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
    this.icon,
    this.inputype,
    required this.obs,
    required this.controller,
  }) : super(key: key);
  final String text;
  final String? htext;
  final Icon? icon;
  final TextInputType? inputype;
  final bool obs;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.11,
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
              controller: controller,
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
