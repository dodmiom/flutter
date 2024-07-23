import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';

class Speecttotext extends StatefulWidget {
  const Speecttotext({super.key});

  @override
  State<Speecttotext> createState() => _SpeecttotextState();
}

class _SpeecttotextState extends State<Speecttotext> {
  final _controller = TextEditingController();
  bool isListening = false;
  late stt.SpeechToText _speechToText = stt.SpeechToText();
  String text = "Please Press Bellow Button And Start talking..";
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Speech To Text",
          style: TextStyle(
              color: const Color.fromARGB(255, 252, 252, 252),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 4, 147, 243),
      ),
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: Color.fromARGB(255, 4, 147, 243),
        duration: const Duration(milliseconds: 1000),
        repeat: true,
        child: FloatingActionButton(
          child: Icon(isListening ? Icons.keyboard_voice_sharp : Icons.mic_off,
              color: Colors.white, size: 15),
          onPressed: _captureVoice,
          backgroundColor: Color.fromARGB(255, 4, 147, 243),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                maxLines: 8,
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold), //or null
                decoration:
                    InputDecoration.collapsed(hintText: "Enter your text here"),
              ),
              // Text(
              //   text,
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _captureVoice() async {
    if (!isListening) {
      bool listen = await _speechToText.initialize();
      if (listen) {
        setState(() {
          isListening = true;
        });
        _speechToText.listen(
            onResult: (result) => setState(() {
                  _controller.text = result.recognizedWords;
                }));
      }
    } else {
      setState(() {
        isListening = false;
      });
      _speechToText.stop();
    }
  }
}
