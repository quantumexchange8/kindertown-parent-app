import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/photo.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

class ShowPhotoPage extends StatefulWidget {
  final String title;
  final List<Photo> morePhotos;
  const ShowPhotoPage(
      {super.key, required this.morePhotos, required this.title});

  @override
  State<ShowPhotoPage> createState() => _ShowPhotoPageState();
}

class _ShowPhotoPageState extends State<ShowPhotoPage> {
  final carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isFirst = currentIndex == 0;
    bool isLast = widget.morePhotos.length > 1
        ? currentIndex == widget.morePhotos.length - 1
        : currentIndex == 0;

    print(currentIndex);

    final threePhotoPreview = widget.morePhotos.length < 3
        ? widget.morePhotos
        : [
            widget.morePhotos[isFirst
                ? 0
                : isLast
                    ? currentIndex - 2
                    : currentIndex - 1],
            widget.morePhotos[isFirst
                ? currentIndex + 1
                : isLast
                    ? currentIndex - 1
                    : currentIndex],
            widget.morePhotos[isLast
                ? widget.morePhotos.length - 1
                : isFirst
                    ? currentIndex + 2
                    : currentIndex + 1],
          ];

    void onTapPrevious() {
      carouselController.previousPage();
    }

    void onTapNext() {
      carouselController.nextPage();
    }

    dynamic onPageChanged(int index, CarouselPageChangedReason reason) {
      setState(() {
        currentIndex = index;
      });
    }

    return Scaffold(
      body: PrimaryPageBackground(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: height20 * 2, horizontal: width10 * 1.4),
          color: Colors.black.withOpacity(0.8),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: width20),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: height10 * 2.6,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height10,
                ),
                _titleRow(
                    onTapNext: onTapNext,
                    onTapPrevious: onTapPrevious,
                    isFirst: isFirst,
                    isLast: isLast,
                    title: widget.title),
                Expanded(
                    child: CarouselSlider.builder(
                  carouselController: carouselController,
                  options: CarouselOptions(
                      height: height100 * 3,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: onPageChanged),
                  itemCount: widget.morePhotos.length,
                  itemBuilder: (context, index, realIndex) {
                    final photo = widget.morePhotos[index];
                    return _picColumn(
                        imageAddress: photo.address,
                        description: photo.description);
                  },
                )),
                _selectPictureRow(
                    onTapNext: onTapNext,
                    onTapPrevious: onTapPrevious,
                    isFirst: isFirst,
                    isLast: isLast,
                    threePhotoPreview: threePhotoPreview)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row _titleRow({
  void Function()? onTapPrevious,
  void Function()? onTapNext,
  required bool isFirst,
  required bool isLast,
  required String title,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      InkWell(
        onTap: onTapPrevious,
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: isFirst ? const Color(0xFF545454) : Colors.white,
          size: height10 * 3.5,
        ),
      ),
      SizedBox(width: height10 * 4.4),
      Text(
        title,
        textAlign: TextAlign.center,
        style: textLg.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
      SizedBox(width: height10 * 4.4),
      InkWell(
        onTap: onTapNext,
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: isLast ? const Color(0xFF545454) : Colors.white,
          size: height10 * 3.5,
        ),
      ),
    ],
  );
}

Column _picColumn({
  required String imageAddress,
  required String? description,
}) {
  return Column(
    children: [
      ZoomOverlay(
        child: Container(
          width: width100 * 4.02,
          height: height100 * 2.53,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAddress),
              fit: BoxFit.fill,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: height08 * 2,
      ),
      if (description != null)
        Text(
          description,
          textAlign: TextAlign.center,
          style: textMd.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        )
    ],
  );
}

Row _selectPictureRow({
  void Function()? onTapPrevious,
  void Function()? onTapNext,
  required bool isFirst,
  required bool isLast,
  required List<Photo> threePhotoPreview,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      isFirst
          ? SizedBox(
              width: width24,
            )
          : InkWell(
              onTap: onTapPrevious,
              child: Icon(
                Icons.arrow_circle_left_outlined,
                color: Colors.white,
                size: height24,
              ),
            ),
      SizedBox(
        width: width24 / 2,
      ),
      ...threePhotoPreview.mapIndexed((i, e) {
        bool isFirstInRow = (i == 0) && isFirst;
        bool isMiddle =
            (i < threePhotoPreview.length - 1 && i > 0) && !isFirst && !isLast;
        bool isLastInRow = (i == threePhotoPreview.length - 1) && isLast;
        return Padding(
          padding: EdgeInsets.only(right: width24 / 2),
          child: Container(
            width: width10 * 9.8,
            height: height10 * 6.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(e.address),
                  fit: BoxFit.fill,
                ),
                border: isFirstInRow || isLastInRow || isMiddle
                    ? Border.all(
                        width: 3,
                        color: yellowPrimary,
                      )
                    : null),
          ),
        );
      }),
      SizedBox(
        width: width24 / 2,
      ),
      isLast
          ? SizedBox(
              width: width24,
            )
          : InkWell(
              onTap: onTapNext,
              child: Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.white,
                size: height24,
              ),
            ),
    ],
  );
}
