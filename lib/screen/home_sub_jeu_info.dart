import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../model/Info.dart';

class HomeSubJeuInfo extends StatefulWidget {
  final String title;
  final Info info;
  const HomeSubJeuInfo({Key? key, required this.title, required this.info})
      : super(key: key);

  @override
  HomeSubJeuInfoState createState() => HomeSubJeuInfoState();
}

class HomeSubJeuInfoState extends State<HomeSubJeuInfo> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      minutes,
      seconds,
    ].join(':');
  }

  Future setAudio() async {
    player.setReleaseMode(ReleaseMode.loop);

    await player.setSource(AssetSource('intro.mp3'));
  }

  @override
  void initState() {
    super.initState();

    setAudio();

    player.onPlayerStateChanged.listen((event) {
      if (mounted) {
        setState(() {
          isPlaying = event == PlayerState.playing;
        });
      }
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        //flèche retour
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: List.generate(
                widget.info.text.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          widget.info.text[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )),
          ),
          if (widget.info.id == 2)
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await player.seek(position);

                await player.resume();
              },
            ),
          if (widget.info.id == 2)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration)),
                  ]),
            ),
          if (widget.info.id == 2)
            CircleAvatar(
              radius: 35,
              child: IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 50,
                onPressed: () async {
                  if (isPlaying) {
                    await player.pause();
                  } else {
                    await player.resume();
                    //isPlaying = true;
                  }
                },
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Suivant')),
          )
        ]),
      ),
    );
  }
}
