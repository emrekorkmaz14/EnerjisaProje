// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sadeneme/add_page/add_page.dart';

class DwellingPage extends StatefulWidget {
  const DwellingPage({Key? key}) : super(key: key);

  @override
  State<DwellingPage> createState() => _DwellingPageState();
}

class _DwellingPageState extends State<DwellingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 178, 240, 195),
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
              vertical: MediaQuery.of(context).size.width * 0.15),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const UsesCard(svg: "assets/homemes.svg", text: "Home"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const UsesCard(svg: "assets/workplacemes.svg", text: "Workplace"),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 40, 122, 50),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AddPage()));
          },
          child: const Icon(Icons.add),
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
  }) : super(key: key);
  final String svg;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
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
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
