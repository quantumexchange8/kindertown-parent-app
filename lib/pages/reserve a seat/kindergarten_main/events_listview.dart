import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/event.dart';
import 'package:kindertown_parent_app/component/content_column.dart';

class EventsListview extends StatelessWidget {
  final List<Event> eventList;
  const EventsListview({super.key, required this.eventList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(width20, height30, width20, height100 * 2),
      itemCount: eventList.length,
      itemBuilder: (context, index) {
        final event = eventList[index];
        return Padding(
          padding: EdgeInsets.only(
              bottom: isLast(index, eventList.length) ? 0 : height30),
          child: ContentColumn(
              iconAddress: 'assets/icons/kindergarten/event_icon.png',
              subtitle: event.name,
              content: _eventContainer(event: event)),
        );
      },
    );
  }
}

Widget _eventContainer({ScrollController? controller, required Event event}) {
  return PrimaryContainer(
    padding: EdgeInsets.symmetric(vertical: height10, horizontal: width08),
    child: Column(
      children: [
        SizedBox(
          height: height08,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width10 * 1.4),
          child: Text(
            event.description,
            style: textXS.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: height24,
        ),
        _filmContainer(totalPhoto: event.pictureList.length),
        SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(height10 * 0.7),
          child: Container(
            color: backgroundColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: event.pictureList
                  .mapIndexed((i, e) => Padding(
                        padding: EdgeInsets.only(
                            right: isLast(i, event.pictureList.length)
                                ? 0
                                : width10 * 0.7),
                        child: Container(
                          width: width100 * 1.15,
                          height: height10 * 8.2,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage(e),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        _filmContainer(totalPhoto: event.pictureList.length),
      ],
    ),
  );
}

Container _filmContainer({required int totalPhoto}) {
  List<Widget> listHoleContainer = [];
  for (var index = 0; index < totalPhoto; index++) {
    for (var i = 0; i < 8; i++) {
      final isLasted = isLast(index, totalPhoto) && isLast(i, 8);

      listHoleContainer.add(
        Padding(
          padding: EdgeInsets.only(right: isLasted ? 0 : width10 * 0.7),
          child: Container(
            width: width10 * 0.9,
            height: height10 * 1.3,
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
            ),
          ),
        ),
      );
    }
  }

  return Container(
    padding: EdgeInsets.symmetric(vertical: height15 / 5),
    color: yellowPrimary,
    child: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisSize: MainAxisSize.min, children: listHoleContainer),
    ),
  );
}
