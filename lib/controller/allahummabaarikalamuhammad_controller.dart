import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AllahummabaarikAlaMuhammadController extends GetxController {

  static AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);

  bool isPlaying = true;
  Rx<Duration> currentPossition = Duration().obs;
  Rx<Duration> audioLength = Duration().obs;

  play()  {
    audioCache.play('quran/AllahummaBaarikAlaMuhammad.mp3');
    update();
  }

  stop(){
    audioPlayer.stop();
    update();
  }

  setUp(){
    audioPlayer.onAudioPositionChanged.listen((d) {
      currentPossition.value = d;
    });
    audioPlayer.onDurationChanged.listen((d) {
      audioLength.value = d;
    });
    update();
  }

  reLoad(){
    audioPlayer.onPlayerCompletion.listen((event) {
      currentPossition.value = Duration(seconds: 0);
      isPlaying = true;
      update();
    });
  }

  @override
  void onInit() {
    audioCache.load('quran/AllahummaBaarikAlaMuhammad.mp3');
    setUp();
  }

}