import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blooc/const/appcolor/appcolors.dart';
import 'package:blooc/const/appfonts/appfonts.dart';
import 'package:blooc/data/models/chracter_model.dart' hide Image;
import 'package:blooc/presentation/widget/richText.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final ChractersModel data =
        ModalRoute.of(context)!.settings.arguments as ChractersModel;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColor.second,
            expandedHeight: 600,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: '${data.id}',
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '${data.image!.original}',
                ),
              ),
              //centerTitle: true,
              title: Text(
                '${data.name}',
                textAlign: TextAlign.left,
              ),
            ),
            floating: false,
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: const EdgeInsets.all(15),
              color: AppColor.second,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichTex(
                      text1: 'Birthday : ',
                      text2: data.birthday != null
                          ? "${data.birthday}"
                          : '1998/10/15 '),
                  const divider(
                    indent: 312,
                  ),
                  RichTex(
                      text1: 'Country  : ',
                      text2: data.country?.name != null
                          ? "${data.country!.name}"
                          : 'United States '),
                  const divider(
                    indent: 318,
                  ),
                  RichTex(
                      text1: 'Statue     : ',
                      text2: data.deathday != null
                          ? "${data.deathday}"
                          : 'Alive '),
                  const divider(
                    indent: 328,
                  ),
                  RichTex(
                      text1: 'Gender    : ',
                      text2: data.gender != null ? "${data.gender}" : 'null '),
                  const divider(
                    indent: 322,
                  ),
                  Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        FlickerAnimatedText('.Dev Mansour Romey',
                            speed: const Duration(milliseconds: 3000),
                            textStyle: AppFonts.frist()),
                      ],
                      repeatForever: true,
                      pause: const Duration(microseconds: 50),
                    ),
                  ),
                  const SizedBox(
                    height: 600,
                  )
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
