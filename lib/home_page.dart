import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hero_case/widgets/exercise_part.dart';
import 'package:hero_case/widgets/feature_container.dart';
import 'package:hero_case/widgets/feeling_bubbles.dart';
import 'package:hero_case/widgets/part_row.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Hello, Sarah Rose',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'How are you feeling today?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Gap(size.height * 0.01),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FeelingBubble(text: 'Love'),
                FeelingBubble(text: 'Cool'),
                FeelingBubble(text: 'Happy'),
                FeelingBubble(text: 'Sad'),
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
