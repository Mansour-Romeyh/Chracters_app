import 'package:blooc/const/appcolor/appcolors.dart';
import 'package:flutter/material.dart';

class RichTex extends StatelessWidget {
  const RichTex({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text1,
          style: TextStyle(
              color: AppColor.third, fontWeight: FontWeight.bold, fontSize: 19),
          children: [
            TextSpan(
                text: text2,
                style: TextStyle(
                    color: AppColor.third, fontWeight: FontWeight.normal)),
          ]),
    );
  }
}

class divider extends StatelessWidget {
  final double indent;
  const divider({super.key, required this.indent});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Divider(
      color: AppColor.frist,
      endIndent: indent,
      thickness: 2,
    ));
  }
}
