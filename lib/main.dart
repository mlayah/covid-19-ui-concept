import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospi_care/config.dart';
import 'package:hospi_care/widgets/prevention_card.dart';
import 'package:hospi_care/widgets/service_card.dart';
import 'package:hospi_care/widgets/starts_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildMainTitle(),
                _buildMyLocation(),
              ],
            ),
            SizedBox(height: 36),
            _buildAppTitle('What are you looking for ?'),
            SizedBox(height: 36),

            // Make a horizontal Listview

            Container(
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ServiceCard(
                      name: 'General\nCheck Up',
                      icon: FontAwesomeIcons.heartbeat,
                      color: Config.blueColor),
                  ServiceCard(
                      name: 'Chat\nWith Doctor',
                      icon: FontAwesomeIcons.commentMedical,
                      color: Config.redColor),
                  ServiceCard(
                      name: 'Health\nNews',
                      icon: FontAwesomeIcons.rss,
                      color: Config.orangeColor),
                  ServiceCard(
                      name: 'Get Doctor\nAdvice',
                      icon: FontAwesomeIcons.userMd,
                      color: Config.greenColor),
                ],
              ),
            ),

            SizedBox(height: 36),

            _buildAppTitle('Disease: Covid-19'),
            SizedBox(height: 24),

            // How Stats card looks like
            //Enclose stats in horizontal list view

            LimitedBox(
              maxHeight: 218,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  StatsCard(
                      country: 'Kenya', infected: 203, dead: 4, cured: 15),
                  StatsCard(
                      country: 'Uganda', infected: 2043, dead: 4, cured: 15),
                  StatsCard(
                      country: 'Tanzania', infected: 23, dead: 4, cured: 15),
                  StatsCard(country: 'US', infected: 212, dead: 4, cured: 15),
                  StatsCard(country: 'UK', infected: 34, dead: 4, cured: 15),
                  StatsCard(
                      country: 'Russia', infected: 75, dead: 4, cured: 15),
                  StatsCard(
                      country: 'China', infected: 203, dead: 4, cured: 15),
                  StatsCard(
                      country: 'Italy', infected: 203, dead: 4, cured: 15),
                ],
              ),
            ),

            SizedBox(height: 24),

            _buildAppTitle('Preventive Measures'),
            SizedBox(height: 16),

            // Preventive measures widgets

            LimitedBox(
              maxHeight: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  PreventionCard(
                    imageUrl: 'assets/hands.jpg',
                    title: 'Wash Hands Often',
                  ),
                  PreventionCard(
                    imageUrl: 'assets/distance.jpg',
                    title: 'Keep Social Distance',
                  ),
                  PreventionCard(
                    imageUrl: 'assets/home.jpg',
                    title: 'Stay at home',
                  ),
                  PreventionCard(
                    imageUrl: 'assets/mask.jpg',
                    title: 'Put on Face Masks',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAppTitle(String title) {
    return Text(
      title,
      style: Config.titleStyle,
    );
  }

  _buildMyLocation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(FontAwesomeIcons.mapMarkerAlt,
            color: Config.primaryColor, size: 14),
        SizedBox(width: 4),
        Text(
          'Nairobi',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Config.primaryColor,
          ),
        ),
        SizedBox(width: 4),
        Icon(FontAwesomeIcons.chevronDown,
            color: Config.primaryColor, size: 14),
      ],
    );
  }

  _buildMainTitle() {
    return RichText(
        text: TextSpan(
            text: 'Hospi',
            style: GoogleFonts.poppins(
              color: Config.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
          TextSpan(
            text: '-care',
            style: GoogleFonts.poppins(
              color: Config.redColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ]));
  }
}
