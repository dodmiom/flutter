import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_translate/google_translate.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';

class Translate extends StatefulWidget {
  const Translate({super.key});

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  var languages = ['Hindi', 'English'];
  var originLanguage = 'From';
  var destLanguage = 'To';
  var output = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });
    if (src == '--' || dest == '--') {
      setState(() {
        output = "Fail to translate";
      });
    }
  }

  String getLanguageCode(String language) {
    if (language == "English") {
      return 'en';
    } else if (language == "Hindi") {
      return 'hi';
    } else if (language == "Arabic") {
      return 'ar';
    }
    return '--';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 28, 41, 38),
        appBar: AppBar(
          title: Text("Translator"),
          centerTitle: true,
          backgroundColor: Color(0xff10223d),
          elevation: 0,
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      destLanguage,
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 4, 4),
                      ),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    items: languages.map((String itemm) {
                      return DropdownMenuItem(
                        child: Text(itemm),
                        value: itemm,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        destLanguage = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 38.0),
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Please enter a text",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                                width: 10.0,
                              )),
                              errorStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                              )),
                          controller: languageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter text to translate';
                            }
                            return null;
                          },
                        ),
                      )),
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      originLanguage,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 245, 7, 7),
                      ),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    items: languages.map((String itemm) {
                      return DropdownMenuItem(
                        child: Text(itemm),
                        value: itemm,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        originLanguage = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 22, 160, 179)),
                      onPressed: () {
                        translate(
                            getLanguageCode(originLanguage),
                            getLanguageCode(destLanguage),
                            languageController.text.toString());
                      },
                      child: Text("Translator"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(
                        text: "\n$output",
                      ));
                      // copied successfully
                    },
                    child: Text(
                      "\n$output",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )));
  }
}
