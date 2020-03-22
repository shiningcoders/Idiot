import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
typedef void OnError(Exception exception);

void main() {
  runApp(new MaterialApp(debugShowCheckedModeBanner: false,home:  LocalAudio()));
}

class LocalAudio extends StatefulWidget {
  @override
  _LocalAudio createState() =>  _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          body: GestureDetector(
            child: FlareActor("assets/idiot.flr", alignment:Alignment.center, fit:BoxFit.cover, animation:"Main"),
            onTap: () => audioCache.play('music.mp3'),
          ),
      ),
    );
  }
}