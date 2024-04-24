import 'package:flutter/material.dart';
import '../component/smartdevicebox.dart';


// Import your SmartDeviceBox widget

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // padding constants
  final double horizontalPadding = 40.0;
  final double verticalPadding = 25.0;

  // list of smart devices
  List<List<dynamic>> mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["Chambre 1", "lib/images/light-bulb.png", true],
    ["Chambre 2", "lib/images/light-bulb.png", false],
   
  ];

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    'lib/images/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  // account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                  Text(
                    'Molka Chekir',
                    // Here you can use custom fonts if desired
                    style: TextStyle(
                      fontFamily: 'CustomFont',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),

            const SizedBox(height: 25),

            // smart devices grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Smart light",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // grid
            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// CustomGoogleFonts class can be used for managing custom fonts in your application
class CustomGoogleFonts {
  // Property
  String fontFamily;

  // Constructor
  CustomGoogleFonts(this.fontFamily);

  // Method to set the font family
  void setFontFamily(String fontFamily) {
    this.fontFamily = fontFamily;
  }

  // Method to get the font family
  String getFontFamily() {
    return fontFamily;
  }

  // Example method
  void customMethod() {
    print('This is a custom method.');
  }
}

void main() {
  // Creating an instance of the CustomGoogleFonts class
  var customFonts = CustomGoogleFonts('Roboto');

  // Using the methods and properties of the custom class
  print('Current font family: ${customFonts.getFontFamily()}');
  customFonts.setFontFamily('Open Sans');
  print('Updated font family: ${customFonts.getFontFamily()}');

  customFonts.customMethod();

  // Running the Flutter app
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}