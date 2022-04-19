import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/core/strings.dart';
import 'package:in_time_petition_demo/model/updates_timeline_item.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';

class UpdatesScreen extends StatefulWidget {
  UpdatesScreen({Key? key}) : super(key: key);

  @override
  State<UpdatesScreen> createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  final timelineItems = <UpdatesTimelineItem>[
    UpdatesTimelineItem("Created petitions for 7 countries", DateTime(2021, 5)),
    UpdatesTimelineItem("More Scientits join the petition", DateTime(2021, 5)),
    UpdatesTimelineItem("First 100+ supporters", DateTime(2021, 5)),
    UpdatesTimelineItem(
        "Reached 1000+ signatures across countries", DateTime(2021, 9)),
  ].reversed.toList();

  late AssetImage image;

  @override
  void initState() {
    image = AssetImage("assets/granny-watching.jpg");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: FractionalOffset.center,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.white.withOpacity(1),
                    ],
                    stops: const [0.0, 1.0],
                  ).createShader(bounds);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: FractionalOffset.topCenter,
                        image: image),
                  ),
                ),
                blendMode: BlendMode.srcATop,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 25),
              child: Text(
                "Updates",
                style: TextStyle(
                    height: 1.3,
                    letterSpacing: 1.2,
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Strings.updatesText,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.8),
                    letterSpacing: 1),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 15,
              ),
              ...timelineItems.asMap().entries.map((entry) => TimelineTile(
                    alignment: TimelineAlign.start,
                    isFirst: entry.key == 0,
                    isLast: entry.key == timelineItems.length - 1,
                    beforeLineStyle:
                        LineStyle(color: Colors.lightBlue, thickness: 3.5),
                    indicatorStyle: IndicatorStyle(color: Color(0xff212529)),
                    endChild: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffF2F3F4),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.value.text,
                              style: TextStyle(
                                  // letterSpacing: 1,
                                  height: 1,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              DateFormat.yMMMMd().format(entry.value.dateTime),
                              style: TextStyle(
                                  // letterSpacing: 1,
                                  height: 1.3,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.8)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
