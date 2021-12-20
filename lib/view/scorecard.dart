import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              'https://picsum.photos/seed/888/600',
              width: 375,
              height: 812,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: AlignmentDirectional(-0.01, -0.56),
              child: Text(
                'DiscMANIA',
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                child: null
              ),
            ),
          ],
        ),
      ),
    );
  }
}
