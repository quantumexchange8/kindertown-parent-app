import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/kid_status/kid_status.dart';
import 'package:kindertown_parent_app/pages/homepage/home/widgets/checked_in_container.dart';
import 'package:kindertown_parent_app/pages/homepage/home/widgets/checked_out_container.dart';

class ClassInfoColumn extends StatelessWidget {
  final KidStatus kidStatus;
  const ClassInfoColumn({super.key, required this.kidStatus});

  @override
  Widget build(BuildContext context) {
    Widget statusWidget;
    final checkInToday = kidStatus.checkIn
        .where((element) =>
            element.time ==
            DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day))
        .toList();
    final checkOutToday = kidStatus.checkOut
        .where((element) =>
            element.time ==
            DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day))
        .toList();

    if (checkInToday.isNotEmpty || checkOutToday.isNotEmpty) {
      if (checkOutToday.isEmpty) {
        final latestCheckIn = checkInToday.first;
        statusWidget = CheckedInContainer(
            temp: latestCheckIn.temperature,
            checkInTime: latestCheckIn.time,
            gender: kidStatus.gender);
      } else {
        final latestCheckOut = checkOutToday.first;
        statusWidget = CheckedOutContainer(
            checkedOutTime: latestCheckOut.time, gender: kidStatus.gender);
      }
    } else {
      statusWidget = Image.asset(
        'assets/images/kid_status/no_record_status.png',
        width: width100 * 3.89,
        fit: BoxFit.fitWidth,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _dateContainer(),
        SizedBox(
          height: height20,
        ),
        statusWidget,
      ],
    );
  }
}

Container _dateContainer() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: height10, horizontal: width15),
    decoration: BoxDecoration(
      image: const DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          image: AssetImage('assets/images/subtitle_background_container.png')),
      borderRadius: BorderRadius.circular(100),
    ),
    child: Text(
      '${DateFormat('dd/mm').format(DateTime.now())} (${DateFormat('EEE').format(DateTime.now())})',
      style: textMd.copyWith(
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
