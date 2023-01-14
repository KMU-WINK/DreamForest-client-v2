import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dreamforest/Store.dart';

class ReviewDetail extends StatelessWidget {
  final List<dynamic> reviewList;
  const ReviewDetail({
    Key? key,
    required this.reviewList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 2, 171, 92),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "리뷰",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
                itemCount: reviewList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // height: 110,
                    //margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 2, 171, 92),
                        ),
                      ),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.white24,
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                            offset: Offset(-3, -3))
                      ],
                      color: Colors.white24,
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              reviewList[index]['review_image'] == null
                                  ? 'https://media.istockphoto.com/id/1357365823/vector/default-image-icon-vector-missing-picture-page-for-website-design-or-mobile-app-no-photo.jpg?b=1&s=170667a&w=0&k=20&c=LEhQ7Gji4-gllQqp80hLpQsLHlHLw61DoiVf7XJsSx0='
                                  : jsonDecode(
                                      reviewList[index]['review_image'])[0],
                              width: 200,
                              fit: BoxFit.cover),
                          ),
                          
                          const SizedBox(
                            height: 24,
                          ),
                          Text.rich(
                            TextSpan(
                                text: reviewList[index]['review_body'] == 'null'
                                    ? ' '
                                    : '${reviewList[index]['review_body']}'),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20.0),
                          ),
                          // Text('${reviewList[index]['review_body']}',
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.bold, fontSize: 20)),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
