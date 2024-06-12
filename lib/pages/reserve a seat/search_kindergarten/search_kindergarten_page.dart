import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_search_bar.dart';
import 'package:kindertown_parent_app/controller/controller.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/kindergarten.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/search_kindergarten/widgets/kindergarten_container.dart';

class SearchKindergartenPage extends StatefulWidget {
  const SearchKindergartenPage({super.key});

  @override
  State<SearchKindergartenPage> createState() => _SearchKindergartenPageState();
}

class _SearchKindergartenPageState extends State<SearchKindergartenPage> {
  final FocusNode _searchFocus = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  List<Kindergarten> currentKindergartenList = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF8EC),
        appBar: primaryAppbar(
            title: PrimarySearchBar(
          focusNode: _searchFocus,
          controller: _searchController,
          hintText: 'school name/location',
        )),
        body: Obx(() {
          final isSearching = _searchController.text.isNotEmpty;
          final kindergartenList = kindergartenController.kindergartenList;
          currentKindergartenList = kindergartenList;

          final searchResult = kindergartenList.where((element) {
            final searchText = _searchController.text;
            return element.name
                    .toLowerCase()
                    .contains(searchText.toLowerCase()) ||
                element.location
                    .toLowerCase()
                    .contains(searchText.toLowerCase());
          }).toList();

          if (isSearching) {
            currentKindergartenList = searchResult;
          }

          return isSearching
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: height30),
                  child: Column(
                    children: [
                      if (isSearching)
                        Text(
                          "${searchResult.length} results in '${_searchController.text}'",
                          style: textLg.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: currentKindergartenList.length,
                        itemBuilder: (context, index) {
                          final kindergarten = currentKindergartenList[index];

                          return KindergartenContainer(
                              kindergarten: kindergarten);
                        },
                      ),
                      if (isSearching)
                        Text(
                          'End of results.',
                          style: textMd.copyWith(
                              fontSize: height10 * 1.7,
                              fontWeight: FontWeight.w700),
                        )
                    ],
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(
                      vertical: height30, horizontal: width20),
                  itemCount: currentKindergartenList.length,
                  itemBuilder: (context, index) {
                    final kindergarten = currentKindergartenList[index];

                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: isLast(index, currentKindergartenList.length)
                              ? 0
                              : height20),
                      child: KindergartenContainer(kindergarten: kindergarten),
                    );
                  },
                );
        }),
      ),
    );
  }
}
