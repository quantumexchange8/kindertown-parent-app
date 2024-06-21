import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class PaymentMethodListContainer extends StatelessWidget {
  final List<Map<String, dynamic>> datas;
  final void Function(int index) onTapData;
  final int selectedIndex;
  const PaymentMethodListContainer(
      {super.key,
      required this.datas,
      required this.onTapData,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      color: Colors.white,
      padding: EdgeInsets.all(height08),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: datas
            .mapIndexed((i, e) => Padding(
                  padding: EdgeInsets.only(bottom: height08 / 2),
                  child: InkWell(
                      onTap: () {
                        onTapData(i);
                      },
                      child: _listContainer(
                          isSelected: selectedIndex == i,
                          isFirst: i == 0,
                          isLast: i == datas.length - 1,
                          logo: e['logo'],
                          name: e['name'])),
                ))
            .toList(),
      ),
    );
  }
}

Container _listContainer({
  required String logo,
  required String name,
  required bool isSelected,
  required bool isFirst,
  required bool isLast,
}) {
  return Container(
    padding:
        EdgeInsets.symmetric(vertical: height05, horizontal: width10 * 1.8),
    decoration: ShapeDecoration(
      color: isSelected ? const Color(0xFFFAF0FC) : const Color(0xFFFFF8EC),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: isFirst ? const Radius.circular(15) : Radius.zero,
            topRight: isFirst ? const Radius.circular(15) : Radius.zero,
            bottomLeft: isLast ? const Radius.circular(15) : Radius.zero,
            bottomRight: isLast ? const Radius.circular(15) : Radius.zero),
      ),
    ),
    child: Row(
      children: [
        Container(
          width: height30,
          height: height30,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage(logo),
              fit: BoxFit.fill,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
        ),
        SizedBox(
          width: width10,
        ),
        Text(
          name,
          style: textMd.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
