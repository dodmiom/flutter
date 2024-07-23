// import 'package:day1/project/recep/recepcard.dart';
// import 'package:day1/project/recep/recepmodal.dart';
// import 'package:day1/project/recep/recipapi.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Recep extends StatefulWidget {
//   const Recep({super.key});

//   @override
//   State<Recep> createState() => _RecepState();
// }

// class _RecepState extends State<Recep> {
//   late List<Receipe> _receipes;
//   bool _isloading = true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getReceipe();
//   }

//   Future<void> getReceipe() async {
//     _receipes = await ReceipeApi.getReceipe();
//     setState(() {
//       _isloading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Center(
//             child: Text(
//               "Tutorial.com",
//               style: TextStyle(
//                 fontSize: 23,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           backgroundColor: Colors.red[400],
//           foregroundColor: Colors.white,
//         ),
//         body: _isloading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : ListView.builder(
//                 itemCount: _receipes.length,
//                 itemBuilder: (context, index) {
//                   return RecipeCard(
//                       title: _receipes[index].name,
//                       cookTime: _receipes[index].totalTime,
//                       rating: _receipes[index].rating.toString(),
//                       thumbnailUrl: _receipes[index].images);
//                 }));
//   }
// }
