import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class PdfPopup extends StatelessWidget {
  final void Function()? onTapViewFullPDF;
  final void Function()? onTapSharePDF;
  const PdfPopup({super.key, this.onTapViewFullPDF, this.onTapSharePDF});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.transparent,
      elevation: 3,
      constraints: const BoxConstraints(),
      surfaceTintColor: Colors.transparent,
      position: PopupMenuPosition.under,
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              height: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      if (onTapViewFullPDF != null) {
                        onTapViewFullPDF!();
                      }
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: width100 * 1.9,
                      height: height10 * 4.7,
                      decoration: ShapeDecoration(
                        color: backgroundColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0x7FF67F00)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/payment/eye_icon.png',
                            height: height10 * 2.8,
                            fit: BoxFit.fitHeight,
                          ),
                          SizedBox(width: width24 / 2),
                          Text(
                            'View full PDF',
                            textAlign: TextAlign.center,
                            style: textMd.copyWith(
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height05),
                  InkWell(
                    onTap: () {
                      if (onTapSharePDF != null) {
                        onTapSharePDF!();
                      }
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: width100 * 1.9,
                      height: height10 * 4.7,
                      decoration: ShapeDecoration(
                        color: backgroundColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0x7FF67F00)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share,
                            color: purplePrimary,
                            size: height10 * 2.8,
                          ),
                          SizedBox(width: width24 / 2),
                          Text(
                            'Share PDF',
                            textAlign: TextAlign.center,
                            style: textMd.copyWith(
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ];
      },
    );
  }
}
