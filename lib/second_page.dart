import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hero_case/home_page.dart';
import 'package:hero_case/widgets/bottom_nav_bar.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Brightness brightness = Theme.of(context).colorScheme.brightness;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondAnimation) =>
                    const HomePage(),
              ),
            );
          },
          icon: const Icon(
            Icons.forward_outlined,
            size: 40,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: brightness,
          systemStatusBarContrastEnforced: false,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
          const Gap(16),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Hello, Sarah Rose',
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'How are you feeling today?',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Gap(size.height * 0.01),
          ],
        ),
      ),
    );
  }
}
