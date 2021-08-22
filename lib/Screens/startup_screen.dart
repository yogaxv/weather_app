import 'package:flutter/material.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("assets/images/vector-landscape-illustration.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: RichText(
                      text: TextSpan(
                        text: 'Find',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                        /*defining default style is optional */
                        children: <TextSpan>[
                          TextSpan(
                              text: ' the sun\nin your City!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      "It's a pleasure to keep track of the \n weather with the new app",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange.shade300, // background
                          onPrimary: Colors.red.shade800, // foreground
                          elevation: 0),
                      onPressed: () {},
                      child: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
