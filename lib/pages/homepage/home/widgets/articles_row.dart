import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/article.dart';

class ArticlesRow extends StatelessWidget {
  final List<Article> articleList;
  const ArticlesRow({super.key, required this.articleList});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: articleList.map((e) => _articleContainer(e)).toList(),
    );
  }
}

Widget _articleContainer(Article article) {
  return Container(
    width: width100 * 2.18,
    height: height100 * 2.68,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: orangePrimary),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Stack(
      children: [
        Column(
          children: [
            Container(
              width: width100 * 2.18,
              height: height100 * 1.1,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(article.image),
                  fit: BoxFit.cover,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width100 * 1.74,
              child: Text(
                article.title,
                style: textMd.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Read more',
                  style: textSm.copyWith(
                      color: yellowPrimary,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: yellowPrimary),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: height20,
                  color: yellowPrimary,
                ),
              ],
            ),
          ],
        ),
        DottedBorder(
          borderPadding: const EdgeInsets.all(2),
          borderType: BorderType.RRect,
          color: redPrimary,
          dashPattern: const [4, 4],
          radius: const Radius.circular(20),
          strokeWidth: 3,
          child: Container(),
        ),
      ],
    ),
  );
}