import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/models/kindergarten.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/about_kindergarten_container.dart';
import 'package:kindertown_parent_app/component/content_column.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/essential_details_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/people_eyeing_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/photos_row.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/rating_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/the_team_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/video_container.dart';

class OverviewListview extends StatelessWidget {
  final Kindergarten kindergarten;
  const OverviewListview({super.key, required this.kindergarten});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: height30),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width24),
          child: const PeopleEyeingContainer(totalPeopleEyeing: 3),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height30),
          child: ContentColumn(
              iconAddress: 'assets/icons/kindergarten/gallery.png',
              subtitle: 'More Photos',
              content: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: width24),
                  scrollDirection: Axis.horizontal,
                  child: PhotosRow(morePhotos: kindergarten.morePhotos))),
        ),
        ContentColumn(
            iconAddress: 'assets/icons/kindergarten/about.png',
            subtitle: 'About the kindergarten',
            content: Padding(
              padding: EdgeInsets.symmetric(horizontal: width24),
              child: AboutKindergartenContainer(
                  title: 'About', aboutText: kindergarten.aboutMe),
            )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height30),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width24),
            child: ContentColumn(
                iconAddress: 'assets/icons/kindergarten/essential_details.png',
                subtitle: 'Essential details',
                content: EssentialDetailsContainer(kindergarten: kindergarten)),
          ),
        ),
        ContentColumn(
            iconAddress: 'assets/icons/kindergarten/reviews.png',
            subtitle: 'Rating',
            content: Padding(
              padding: EdgeInsets.symmetric(horizontal: width24),
              child: RatingContainer(kindergarten: kindergarten),
            )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height30),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width24),
            child: ContentColumn(
                iconAddress: 'assets/icons/kindergarten/group.png',
                subtitle: 'The team',
                content:
                    TheTeamContainer(teacherList: kindergarten.teacherList)),
          ),
        ),
        ContentColumn(
            iconAddress: 'assets/icons/kindergarten/gallery.png',
            subtitle: 'Video',
            content: Padding(
              padding: EdgeInsets.symmetric(horizontal: width24),
              child: VideoContainer(videoAddress: kindergarten.videoAddress),
            )),
        SizedBox(
          height: height100 * 1.5,
        )
      ],
    );
  }
}
