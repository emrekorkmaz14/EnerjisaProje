import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sadeneme/login_page/login_page.dart';
import 'package:sadeneme/services/firestore_services.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  late final myController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 178, 240, 195),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.27,
              horizontal: MediaQuery.of(context).size.width * 0.08),
          child: Column(
            children: [
              TextField1(
                controller: myController,
                text: "Electricity Meter No",
                obs: false,
              ),
              TextField1(
                  controller: myController1,
                  text: "Water Meter No",
                  obs: false),
              TextField1(
                  controller: myController2, text: "Gas Meter No", obs: false),
              TextField1(
                  controller: myController3,
                  text: "Name To Be Registered",
                  obs: false),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    if (myController2 == null) {
                      firestore.collection("enerji") // topics koleksiyonunu seç
                          .add(// şu map nesnesini ekle
                              {
                        "Electric": myController,
                        "Gas": myController2,
                        "Water": myController1
                      }).then((value) {
                        print(value);
                        Navigator.pop(context);
                      });
                    } else {
                      print("");
                    }
                  },
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
            ],
          ),
        ),
      ),
    );
  }
}
