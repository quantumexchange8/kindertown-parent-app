import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/models/kindergarten.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/about_kindergarten_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/essential_details_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/people_eyeing_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/photos_row.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/rating_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/subtitle_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/the_team_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/video_container.dart';

class OverviewListview extends StatelessWidget {
  final Kindergarten kindergarten;
  const OverviewListview({super.key, required this.kindergarten});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: height30),
      children: [
        const PeopleEyeingContainer(totalPeopleEyeing: 3),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height30),
          child: _contentColumn(
              iconAddress: 'assets/icons/kindergarten/gallery.png',
              subtitle: 'More Photos',
              content: PhotosRow(morePhotos: kindergarten.morePhotos)),
        ),
        _contentColumn(
            iconAddress: 'assets/icons/kindergarten/about.png',
            subtitle: 'About the kindergarten',
            content:
                AboutKindergartenContainer(aboutText: kindergarten.aboutMe)),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height30),
          child: _contentColumn(
              iconAddress: 'assets/icons/kindergarten/essential_details.png',
              subtitle: 'Essential details',
              content: EssentialDetailsContainer(kindergarten: kindergarten)),
        ),
        _contentColumn(
            iconAddress: 'assets/icons/kindergarten/reviews.png',
            subtitle: 'Rating',
            content: RatingContainer(kindergarten: kindergarten)),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height30),
          child: _contentColumn(
              iconAddress: 'assets/icons/kindergarten/group.png',
              subtitle: 'The team',
              content: TheTeamContainer(teacherList: kindergarten.teacherList)),
        ),
        _contentColumn(
            iconAddress: 'assets/icons/kindergarten/gallery.png',
            subtitle: 'Video',
            content: VideoContainer(videoAddress: kindergarten.videoAddress)),
      ],
    );
  }
}

Column _contentColumn({
  required String iconAddress,
  required String subtitle,
  required Widget content,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SubtitleContainer(iconAddress: iconAddress, subtitle: subtitle),
      SizedBox(
        height: height08 * 2,
      ),
      content
    ],
  );
}
