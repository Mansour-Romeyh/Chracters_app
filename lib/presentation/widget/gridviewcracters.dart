import 'package:blooc/const/appcolor/appcolors.dart';
import 'package:blooc/const/approut/Approute.dart';
import 'package:blooc/data/models/chracter_model.dart' hide Image;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GridviewChracters extends StatelessWidget {
  final List<ChractersModel> model;
  final int itemCount;
  const GridviewChracters({
    super.key,
    required this.itemCount,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.8,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            color: AppColor.second,
            border: Border.all(
              color: AppColor.third,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: InkWell(
                child: model[index].image == null
                    ? Lottie.asset('assets/lottile/loading2.json')
                    : Hero(
                        tag: '${model[index].id}',
                        child: CachedNetworkImage(
                          fit: BoxFit.fitWidth,
                          imageUrl: '${model[index].image!.original}',
                        ),
                      ),
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.home2_screen,
                      arguments: model[index]);
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 7),
                height: 35,
                width: 200,
                color: AppColor.forth,
                child: Text(
                  '${model[index].name}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
