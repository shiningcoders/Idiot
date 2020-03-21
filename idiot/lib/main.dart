import 'package:flare_flutter/flare_actor.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AssetsAudioPlayer _assetsAudioPlayer;
  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer();
    _assetsAudioPlayer.open(
      AssetsAudio(
        asset: "music.mp3",
        folder: "assets/",
      ),
    );
    _assetsAudioPlayer.playOrPause();
  }

  @override
  void dispose() {
    _assetsAudioPlayer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new FlareActor("assets/idiot.flr", alignment:Alignment.center, fit:BoxFit.cover, animation:"Main");
  }
}

