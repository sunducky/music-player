import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:music_player/values/constants.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  double deviceWidth = 0;

  @override
  Widget build(BuildContext context) {
    //get deviceWidth
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Album Art Cover
              Container(
                height: deviceWidth -
                    80, //Making the container height equal to the device width to make it square
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primary.withOpacity(0.1),
                      offset: const Offset(0, 40),
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //Song Title x Artist Name, Favorite Button
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Song Title',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.textColor(context),
                          ),
                        ),
                        Text(
                          'Artist Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.textColor(context).withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                    //Animated icon
                    LikeButton(
                      circleColor: const CircleColor(
                          start: AppColor.accent, end: AppColor.primary),
                      bubblesColor: const BubblesColor(
                        dotPrimaryColor: AppColor.primary,
                        dotSecondaryColor: AppColor.accent,
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          isLiked
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                          color: isLiked ? AppColor.primary : Colors.grey,
                        );
                      },
                    )
                  ],
                ),
              ),

              //Seek Bar with Time below it
              SliderTheme(
                data: SliderThemeData(
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 0),
                  trackShape: CustomTrackShape(),
                  trackHeight: 8,
                ),
                child: Slider(
                  value: 0.5,
                  activeColor: AppColor.primary,
                  thumbColor: AppColor.backgroundColor(context),
                  onChanged: (value) {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0:00',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textColor(context),
                    ),
                  ),
                  Text(
                    '3:00',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textColor(context),
                    ),
                  ),
                ],
              ),
              //
              const SizedBox(height: 30),
              //Previous, Play, Next Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAsset.svgPrev,
                    height: 35,
                    color: AppColor.primary.withOpacity(.3),
                  ),
                  const SizedBox(width: 40),
                  SvgPicture.asset(
                    AppAsset.svgPlay,
                    height: 50,
                    color: AppColor.primary,
                  ),
                  const SizedBox(width: 40),
                  SvgPicture.asset(
                    AppAsset.svgNest,
                    height: 35,
                    color: AppColor.primary.withOpacity(.3),
                  ),
                ],
              ),
              //
              const Spacer(),
              //Show Live Broadcasting
              Row(
                children: [
                  //Dot
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: AppColor.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Live Broadcasting',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                    ),
                  ),
                  //Show three stacked avatars
                  const Spacer(),
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: AppColor.accent,
                            image: const DecorationImage(
                              image: AssetImage(AppAsset.avatar1),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColor.backgroundColor(context),
                              width: 3,
                            )),
                      ),
                      Container(
                        height: 38,
                        width: 38,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: AppColor.accent,
                            image: const DecorationImage(
                              image: AssetImage(AppAsset.avatar2),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColor.backgroundColor(context),
                              width: 3,
                            )),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        margin: const EdgeInsets.only(left: 40),
                        decoration: BoxDecoration(
                            color: AppColor.accent,
                            image: const DecorationImage(
                              image: AssetImage(AppAsset.avatar3),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColor.backgroundColor(context),
                              width: 3,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    const double trackHeight = 8;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}