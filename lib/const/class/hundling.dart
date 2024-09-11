import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blooc/const/appfonts/appfonts.dart';
import 'package:blooc/const/class/statuse_request.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppHundling extends StatelessWidget {
  final VoidCallback ontap;
  final StatuseRequest statuseRequest;
  const AppHundling({
    super.key,
    required this.statuseRequest,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) =>
      statuseRequest == StatuseRequest.statuseloding
          ? Lottie.asset('assets/lottile/loading1.json')
          : statuseRequest == StatuseRequest.statuseerroNetwork
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/lottile/internet.json',
                    ),
                    AnimatedTextKit(
                      onTap: ontap,
                      animatedTexts: [
                        FlickerAnimatedText('.Try Again',
                            speed: const Duration(milliseconds: 3000),
                            textStyle: AppFonts.second()),
                      ],
                      repeatForever: true,
                      pause: const Duration(microseconds: 50),
                    ),
                  ],
                )
              : statuseRequest == StatuseRequest.statusefailure
                  ? Lottie.asset('assets/lottile/faulire.json')
                  : SizedBox.shrink();
}
