// import 'Store.dart';
// import 'package:flutter/material.dart';

// class ItemCard extends StatelessWidget {
//   final Menu? menu;
//   final Function? press;
//   const ItemCard({
//     Key? key,
//     this.menu,
//     this.press,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.all(20.0),
//               // For  demo we use fixed height  and width
//               // Now we dont need them
//               // height: 180,
//               // width: 160,
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 139, 204, 78),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Hero(
//                 tag: "${menu?.id}",
//                 child: Image.asset(menu!.image!, fit: BoxFit.fill),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20.0 / 2),
//             child: 
//               Text(
//               // products is out demo list
//               menu!.name!,
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//           Text(
//             "${menu?.price}",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           )
//         ],
//       ),
//     );
//   }
// }