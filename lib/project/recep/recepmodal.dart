class Receipe {
  String name;
  double rating;
  String images;
  String totalTime;

  Receipe(
      {required this.name,
      required this.rating,
      required this.images,
      required this.totalTime});

  factory Receipe.fromJson(dynamic json) {
    return Receipe(
      name: json['name'],
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'].toDouble(),
      totalTime: json['totalTime'] as String,
    );
  }

  static List<Receipe> receipeSnap(List snapshot) {
    return snapshot.map((data) {
      return Receipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Receipe {name:$name,images:$images,rating:$rating,totalTime:$totalTime}';
  }
}
