import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 178, 240, 195),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.1,
              horizontal: MediaQuery.of(context).size.width * 0.08),
          child: Column(
            children: [
              Row(
                children: [
                  /* SizedBox(
                    height: MediaQuery.of(context).size.width * 0.15,
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: SvgPicture.asset("assets/world.svg"),
                  ),
                  const SizedBox(width: 20), */
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi Aleyna!",
                        style: GoogleFonts.roboto(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ),
                      Text(
                        "Lets save our money",
                        style: GoogleFonts.roboto(
                            color: Colors.grey.shade600, fontSize: 22),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.notifications,
                    size: MediaQuery.of(context).size.height * 0.045,
                    color: const Color.fromARGB(255, 46, 117, 75),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Lottie.asset("assets/greenenergy.json",
                      height: MediaQuery.of(context).size.height * 0.35),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    "Daha az enerji tüketmeleri için buzdolabı ve derin dondurucuyu güneş almayan, arkası ve yanları hava alabilecek şekilde konumlandırmalısınız.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.025),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
