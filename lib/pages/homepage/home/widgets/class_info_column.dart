import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class ClassInfoColumn extends StatelessWidget {
  const ClassInfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'dfg',
    );
  }
}

Container _dateContainer() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: height10, horizontal: width15),
    decoration: BoxDecoration(
      image: const DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/images/subtitle_background_container.png')),
      borderRadius: BorderRadius.circular(100),
      boxShadow: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        )
      ],
    ),
    child: Text(
      '${DateFormat('dd/mm').format(DateTime.now())} (${DateFormat('EEE').format(DateTime.now())})',
      style: textMd.copyWith(
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

Container _statusContainer({
  required double temp,
}) {
  return Container(
    width: 389,
    height: 124,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21),
      ),
      shadows: [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        )
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 389,
          height: 161,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 389,
                  height: 161,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 22,
                top: 16,
                child: Container(
                  width: 160,
                  height: 160,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 117.89,
                        child: Container(
                          width: 160,
                          height: 42.11,
                          child: Stack(),
                        ),
                      ),
                      Positioned(
                        left: 59.70,
                        top: 84.99,
                        child: Container(
                          width: 79.66,
                          height: 43.54,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 2.32,
                                top: 32.80,
                                child: Container(
                                  width: 68.40,
                                  height: 9.56,
                                  child: Stack(),
                                ),
                              ),
                              Positioned(
                                left: 9.91,
                                top: 0,
                                child: Container(
                                  width: 69.75,
                                  height: 40.45,
                                  child: Stack(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 38.19,
                        top: 115.72,
                        child: Container(
                          width: 20.69,
                          height: 11.86,
                          child: Stack(),
                        ),
                      ),
                      Positioned(
                        left: 39.55,
                        top: 112.50,
                        child: Container(
                          width: 19.28,
                          height: 12.79,
                          child: Stack(),
                        ),
                      ),
                      Positioned(
                        left: 18.39,
                        top: -0,
                        child: Container(
                          width: 80.73,
                          height: 82.22,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 25.91,
                                top: 37.92,
                                child: Container(
                                  width: 46.30,
                                  height: 21.94,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 31.08,
                                        top: 0,
                                        child: Container(
                                          width: 15.22,
                                          height: 15.97,
                                          child: Stack(),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 6.14,
                                        child: Container(
                                          width: 17.91,
                                          height: 15.80,
                                          child: Stack(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 40.19,
                                top: 58.97,
                                child: Container(
                                  width: 23.61,
                                  height: 14.09,
                                  child: Stack(),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 12.11,
                                child: Container(
                                  width: 22.12,
                                  height: 22.78,
                                  child: Stack(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 384.40,
          height: 120.08,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF3C0048)),
              borderRadius: BorderRadius.circular(21),
            ),
          ),
        ),
        Container(
          width: 377.49,
          height: 114.58,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: Color(0xFF479138)),
              borderRadius: BorderRadius.circular(21),
            ),
          ),
        ),
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 30,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 9,
                      child: SizedBox(
                        width: 70,
                        height: 21,
                        child: Text(
                          '7:50a.m.',
                          style: TextStyle(
                            color: Color(0xFF479138),
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            height: 0.09,
                            letterSpacing: 0.80,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Text(
                        'checked-in:',
                        style: TextStyle(
                          color: Color(0xFF479138),
                          fontSize: 10,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          height: 0.15,
                          letterSpacing: 0.50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 7),
              Container(
                width: 71,
                height: 21,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 71,
                        height: 19,
                        decoration: ShapeDecoration(
                          color: Color(0xFFDFF6E5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 2.10,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8,
                      top: 0,
                      child: Text(
                        'in class',
                        style: TextStyle(
                          color: Color(0xFF479138),
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          height: 0.11,
                          letterSpacing: 0.70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 181,
          height: 94.18,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 6.28,
                child: Container(
                  width: 19.53,
                  height: 19.62,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE5FFEB),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 146.45,
                top: 19.62,
                child: Container(
                  width: 19.53,
                  height: 19.62,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE5FFEB),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 135.18,
                top: 6.28,
                child: Container(
                  width: 6.76,
                  height: 6.28,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE5FFEB),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 174.24,
                top: 64.36,
                child: Container(
                  width: 6.76,
                  height: 6.28,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE5FFEB),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 25.54,
                top: 0,
                child: Container(
                  width: 6.76,
                  height: 6.28,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE5FFEB),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 141.94,
                top: 54.15,
                child: Container(
                  width: 6.76,
                  height: 6.28,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE5FFEB),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 141.94,
                top: 74.56,
                child: Container(
                  width: 19.53,
                  height: 19.62,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE5FFEB),
                    shape: OvalBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 157,
          height: 64,
          child: Text(
            '36.4℃',
            style: TextStyle(
              color: Color(0xFFFCFFFD),
              fontSize: 48,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              height: 0.03,
              letterSpacing: 2.40,
            ),
          ),
        ),
      ],
    ),
  );
}
