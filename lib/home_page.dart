import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hero_case/second_page.dart';
import 'package:hero_case/widgets/bottom_nav_bar.dart';
import 'package:hero_case/widgets/exercise_part.dart';
import 'package:hero_case/widgets/feature_container.dart';
import 'package:hero_case/widgets/feeling_bubbles.dart';
import 'package:hero_case/widgets/part_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> items = [
    const FeatureContainer(),
    const FeatureContainer(),
    const FeatureContainer(),
  ];

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
                    const SecondPage(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FeelingBubble(text: 'Love'),
                Gap(size.width * 0.04),
                const FeelingBubble(text: 'Cool'),
                Gap(size.width * 0.04),
                const FeelingBubble(text: 'Happy'),
                Gap(size.width * 0.04),
                const FeelingBubble(text: 'Sad'),
              ],
            ),
            Gap(size.height * 0.01),
            const PartRow(
              text: "Feature",
            ),
            Gap(size.height * 0.01),
            CarouselSlider(
              items: items,
              carouselController: _controller,
              options: CarouselOptions(
                height: 190,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items.asMap().entries.map((entry) {
                return Container(
                  width: 7.0,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 3.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                );
              }).toList(),
            ),
            Gap(size.height * 0.01),
            const PartRow(
              text: "Exercise",
            ),
            Gap(size.height * 0.01),
            const ExercisePart(),
          ],
        ),
      ),
    );
  }
}
