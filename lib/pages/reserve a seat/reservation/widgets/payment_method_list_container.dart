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
}) {
  return Container(
    padding:
        EdgeInsets.symmetric(vertical: height05, horizontal: width10 * 1.8),
    decoration: ShapeDecoration(
      color: isSelected ? const Color(0xFFAF00D3) : const Color(0xFFFFF8EC),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
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
