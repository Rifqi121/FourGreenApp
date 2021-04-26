import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CarouselVideo extends StatefulWidget {
  @override
  _CarouselVideoState createState() => _CarouselVideoState();
}

class _CarouselVideoState extends State<CarouselVideo> {
  DocumentReference linkRef;
  List<String> videoID = [];
  bool showItem = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: showItem
            ? ListView.builder(
                itemCount: videoID.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(8),
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                        initialVideoId:
                            YoutubePlayer.convertUrlToId(videoID[index]),
                        flags: YoutubePlayerFlags(autoPlay: false)),
                    showVideoProgressIndicator: true,
                  ),
                ),
              )
            : CircularProgressIndicator());
  }

  void initState() {
    linkRef = Firestore.instance.collection('links').document('urls');
    super.initState();
    getData();
    print(videoID);
  }

  getData() async {
    await linkRef
        .get()
        .then((value) => value.data?.forEach((key, value) {
              if (!videoID.contains(value)) {
                videoID.add(value);
              }
            }))
        .whenComplete(() => setState(() {
              videoID.shuffle();
              showItem = true;
            }));
  }
}