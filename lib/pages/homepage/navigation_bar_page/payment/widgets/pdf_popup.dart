import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class PdfPopup extends StatelessWidget {
  const PdfPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.transparent,
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 190,
                height: 47.42,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 190,
                        height: 47.42,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFFF8EC),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0x7FF67F00)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: height10 * 2.8,
                              height: height10 * 2.8,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                            ),
                            Text(
                              'View full PDF',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF3C0048),
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: 190,
                height: 47.42,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 190,
                        height: 47.42,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFFF8EC),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0x7FF67F00)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 77,
                      top: 14,
                      child: Text(
                        'Share PDF',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF3C0048),
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 34,
                      top: 10,
                      child: Container(
                        width: 28,
                        height: 28,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ];
      },
    );
  }
}
