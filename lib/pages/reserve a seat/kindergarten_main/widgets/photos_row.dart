import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/photo.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/show_photo_page.dart';

List<Map<String, dynamic>> photosList = [
  {
    'name': 'Playground',
    'address': 'assets/images/kindergarten/playground_background.png',
  },
  {
    'name': 'Classroom',
    'address': 'assets/images/kindergarten/classroom_background.png',
  },
  {
    'name': 'Cafeteria',
    'address': 'assets/images/kindergarten/cafeteria_background.png',
  },
  {
    'name': 'Restroom',
    'address': 'assets/images/kindergarten/restroom_background.png',
  },
];

class PhotosRow extends StatelessWidget {
  final List<Photo> morePhotos;
  const PhotosRow({super.key, required this.morePhotos});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: photosList
          .mapIndexed((i, e) => Padding(
                padding: EdgeInsets.only(
                    right: isLast(i, photosList.length) ? 0 : width10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowPhotoPage(
                              morePhotos: morePhotos
                                  .where((element) =>
                                      element.type ==
                                      e['name'].toString().toLowerCase())
                                  .toList(),
                              title: e['name']),
                        ));
                  },
                  child: _photoContainer(
                      photoAddress: e['address'], name: e['name']),
                ),
              ))
          .toList(),
    );
  }
}

Container _photoContainer({
  required String photoAddress,
  required String name,
}) {
  return Container(
    width: height100 * 1.1,
    height: height100 * 1.1,
    decoration: ShapeDecoration(
      image: DecorationImage(
        image: AssetImage(photoAddress),
        fit: BoxFit.fill,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(2),
      decoration: ShapeDecoration(
        color: Colors.black.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: DottedBorder(
          color: yellowPrimary,
          strokeWidth: 2,
          dashPattern: const [2, 2],
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: textSm.copyWith(
              color: Colors.white,
              fontSize: height10 * 1.3,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    ),
  );
}
