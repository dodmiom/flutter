import 'package:day1/project/networking/network_api.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Network_Home extends StatelessWidget {
  const Network_Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meme"),
      ),
      body: FutureBuilder(
          future: API.getMemes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data!.memes!.length,
                itemBuilder: (context, index) {
                  final meme = snapshot.data!.memes![index];
                  return Card(
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                            imageUrl: meme.url!,
                            fit: BoxFit.cover,
                            placeholder: (context, url) {
                              return const SizedBox.shrink(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error))
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
