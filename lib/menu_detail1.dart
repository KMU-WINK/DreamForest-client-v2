// import 'package:dreamforest/item_card.dart';
// import 'package:flutter/material.dart';
// import 'package:dreamforest/Store.dart';

// class MenuDetail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 2, 171, 92),
//       ),
//       body : Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           const SizedBox(height: 30,),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Text(
//               "메뉴",
//               style: Theme.of(context)
//                   .textTheme
//                   .headline5
//                   ?.copyWith(fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(height: 30),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: GridView.builder(
//                   itemCount: menus.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 20.0,
//                     crossAxisSpacing: 20.0,
//                     childAspectRatio: 0.75,
//                   ),
//                   itemBuilder: (context, index) => ItemCard(
//                         menu: menus[index],
//                       )),
//             ),
//           ),
//         ],
//       )
//     );
//   }
// }
