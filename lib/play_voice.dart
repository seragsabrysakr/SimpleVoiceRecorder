import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayVoice extends StatefulWidget {
  const PlayVoice({Key? key}) : super(key: key);

  @override
  State<PlayVoice> createState() => _PlayVoiceState();
}

class _PlayVoiceState extends State<PlayVoice> {
  late AudioPlayer player;
  late AudioCache cache;
  bool isplaying = false;
  Duration currentduration=Duration();
  Duration voicelength=Duration();
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player);
    cache.load('Dndnha.Com.Wegz.ElBakht.mp3');
    setup();
  }
setup(){
  player.onAudioPositionChanged.listen((event) {
    setState(() {
          currentduration=event;
    });
  });
  player.onDurationChanged.listen((event) {
    setState(() {
          voicelength=event;
    });
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        title: Text('play voice'),
      ),
      backgroundColor: Colors.green.shade100,
      body: Column(
        children: [
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .6,
            child: Text(
              'Play music',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Text('${currentduration.inMinutes}:${currentduration.inSeconds}'),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Slider(
                      value: currentduration.inSeconds.toDouble(),
                      max: voicelength.inSeconds.toDouble(),
                      onChanged: (val) {
                      //  val =currentduration.inSeconds.toDouble();
                      seekTo(val.toInt());
                       
                      },
                      activeColor: Colors.green,
                      inactiveColor: Colors.white)),
              // Text('${voicelength.inMinutes}:${voicelength.inSeconds}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.first_page),
                iconSize: 35,
              ),
              IconButton(
                  onPressed: () {
                    if (!isplaying) {
                      setState(() {
                        isplaying = true;
                        setState(() {
                          setState(() {});
                          playmusic();
                        });
                      });
                    } else {
                      setState(() {
                        isplaying = false;
                      });
                      stopmusic();
                    }
                  },
                  icon: Icon(isplaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 35),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.last_page), iconSize: 35),
            ],
          ),
        ],
      ),
    );
  }

   stopmusic() {
    player.pause();
  }

   playmusic() {
    cache.play('Dndnha.Com.Wegz.ElBakht.mp3');
  }
  seekTo(int sec)
  {// To seek the audio to a new position
    player.seek(Duration(seconds: sec));
  }
}
