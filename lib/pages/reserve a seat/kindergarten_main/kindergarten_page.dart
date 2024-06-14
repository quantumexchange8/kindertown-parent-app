import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/models/event.dart';
import 'package:kindertown_parent_app/models/kindergarten.dart';
import 'package:kindertown_parent_app/models/programme.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/events_listview.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/overview_listview.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/programmes_listview.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/header_row.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/kindergarten_bottom_bar.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/tab_row.dart';

class KindergartenPage extends StatefulWidget {
  final Kindergarten kindergarten;
  final List<Programme> programmeList;
  final List<Event> eventList;
  const KindergartenPage(
      {super.key,
      required this.kindergarten,
      required this.programmeList,
      required this.eventList});

  @override
  State<KindergartenPage> createState() => _KindergartenPageState();
}

const _tabList = ['Overview', 'Programmes', 'Events'];

class _KindergartenPageState extends State<KindergartenPage> {
  int activeTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final kindergarten = widget.kindergarten;
    final tabWidgets = [
      OverviewListview(kindergarten: kindergarten),
      ProgrammesListview(programmeList: widget.programmeList),
      EventsListview(eventList: widget.eventList)
    ];

    void onTabTap(int tabIndex) {
      setState(() {
        activeTabIndex = tabIndex;
      });
    }

    return Scaffold(
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Image.asset(
                kindergarten.backgroundPhoto,
                height: height100 * 4.3,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Positioned(
            top: height100 * 1.67,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width30),
                child: HeaderRow(
                    kindergartenName: kindergarten.name,
                    kindergartenLocation: kindergarten.location,
                    totalStudent: kindergarten.totalStudent,
                    maxStudent: kindergarten.maxStudent,
                    isLiked: kindergarten.isLiked),
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.only(top: height100 * 3),
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.symmetric(vertical: height15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width24),
                        child: TabRow(
                            onTabTap: onTabTap,
                            tabList: _tabList,
                            activeIndex: activeTabIndex),
                      ),
                      tabWidgets[activeTabIndex]
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: KindergartenBottomBar(kindergarten: kindergarten),
    );
  }
}
