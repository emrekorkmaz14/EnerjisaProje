import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sadeneme/login_page/login_page.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
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
            vertical: MediaQuery.of(context).size.width * 0.27,
            horizontal: MediaQuery.of(context).size.width * 0.08),
        child: Column(
          children: [
            const TextField1(text: "Electricity Meter No",obs: false,),
            const TextField1(text: "Water Meter No",obs: false),
            const TextField1(text: "Gas Meter No",obs: false),
            const TextField1(text: "Name To Be Registered",obs: false),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.1,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Save",
                  style: GoogleFonts.roboto(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w800),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
