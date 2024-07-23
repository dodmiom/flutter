import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  Future<List<Icecream>?> loadIcecream() async {
    final icecream = await rootBundle.loadString("assets/json/icecream.json");
    await Future.delayed(const Duration(seconds: 1));
    final decodedicecream = jsonDecode(icecream);
    return decodedicecream;
  }

  @override
  Widget build(BuildContext context) {
    Icecream selectedIcecream;
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Icecream",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            "We have something for you",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: loadIcecream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // final decodedicecream =
                      //     snapshot.data as Map<String, dynamic>;
                      final icecreams = snapshot.data;
                      return Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height / 3,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                final icecream = icecreams[index];
                                selectedIcecream = icecream[0];

                                return icecreamCard(icecream, context);
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: icecreams!.length,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                  })
            ],
          ))
        ],
      ),
    );
  }

  SizedBox icecreamCard(icecream, BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.orange.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              icecream.image!,
              fit: BoxFit.cover,
              color: Colors.deepOrange.withOpacity(0.5),
              colorBlendMode: BlendMode.color,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      icecream.flavor,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "\$${icecream.price.toString()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final topping=selectedIcecream!.topping![index];
                                return ListTile(
                                  title: Text(topping),
                                )
                                
                              },
                              scrollDirection: Axis.vertical,
                              itemCount: selectedIcecream!.topping!.length,
                            ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
