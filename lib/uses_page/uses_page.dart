import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../uses_control_page/control_page.dart';

class UsesPage extends StatefulWidget {
  const UsesPage({Key? key}) : super(key: key);

  @override
  State<UsesPage> createState() => _UsesPageState();
}

class _UsesPageState extends State<UsesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          
          backgroundColor: Colors.white,
          title: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.07,
              ),
              SvgPicture.asset("assets/logos.svg",
                  height: MediaQuery.of(context).size.height * 0.05),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Text(
                "Energy Saver",
                style: GoogleFonts.roboto(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08,
              vertical: MediaQuery.of(context).size.width * 0.08),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UsesCard(
                  svg: "assets/useselec.svg",
                  text: "Electric",
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ControlPage()));
                  },
                ),
                UsesCard(
                  svg: "assets/useswater.svg",
                  text: "Water",
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ControlPage()));
                  },
                ),
                UsesCard(
                  svg: "assets/usesradiot.svg",
                  text: "Gas",
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ControlPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UsesCard extends StatelessWidget {
  const UsesCard({
    Key? key,
    required this.svg,
    required this.text,
    required this.onPress,
  }) : super(key: key);
  final String svg;
  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.18,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08),
          child: Row(
            children: [
              SvgPicture.asset(
                svg,
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              const Spacer(),
              Text(
                text,
                style: GoogleFonts.roboto(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
