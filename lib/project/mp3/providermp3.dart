import 'package:audioplayers/audioplayers.dart';
import 'package:day1/project/mp3/song.dart';
import 'package:flutter/cupertino.dart';

class Mp3provider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        Name: "Mere Liye Tum Kaafi Ho",
        artistname: "Ayushman Khurana",
        artistpic: "assets/image/kaffiho.jpg",
        audiopath: "assets/mp3/kaffiho.mp3",
        audiopic: "assets/image/kaffiho.jpg")
  ];

  int? _currentSongindex;

  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  bool _isPlaying = false;

  void play() async {
    final String path = _playlist[_currentSongindex!].audiopath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pausedOrresume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void playNextSong() {
    if (_currentSongindex != null) {
      if (_currentSongindex! < _playlist.length - 1) {
        currentSongIndex = _currentSongindex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
  }

  void playPreviousSong() {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongindex! > 0) {
        currentSongIndex = _currentSongindex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((event) {
      _totalDuration = event;
      notifyListeners();
    });
    _audioPlayer.onPositionChanged.listen((event) {
      _currentDuration = event;
      notifyListeners();
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  PlaylistProvider() {
    listenToDuration();
  }

  List<Song> get playlist => _playlist;

  int? get currentSongIndex => _currentSongindex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentSongIndex(int? newIndex) {
    _currentSongindex = newIndex;

    if (newIndex != null) {
      play();
    }
    notifyListeners();
  }
}
