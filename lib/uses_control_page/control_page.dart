
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sadeneme/statistics.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 178, 240, 195),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.width * 0.35),
        child: Column(
          children: [
            Text(
              "Görüntülemek İstediğiniz Zaman Dilimini Seçiniz.",
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.025,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Listtilewidget(
                svg: SvgPicture.asset("assets/daily.svg"), text: " Günlük "),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Listtilewidget(
                svg: SvgPicture.asset("assets/daily.svg"), text: " Haftalık "),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Listtilewidget(
                svg: SvgPicture.asset("assets/daily.svg"), text: " Aylık "),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class Listtilewidget extends StatelessWidget {
  const Listtilewidget({
    Key? key,
    required this.svg,
    required this.text,
  }) : super(key: key);
  final SvgPicture svg;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white70,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Statistics()));
      },
      leading: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.height * 0.1,
        child: svg,
      ),
      title: Text(
        text,
        style: GoogleFonts.roboto(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.height * 0.03,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
