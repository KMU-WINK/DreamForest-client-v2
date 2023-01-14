import 'package:flutter/material.dart';
import 'package:dreamforest/Store.dart';

class MenuDetail extends StatelessWidget {
  final List<Menu> menus;
  const MenuDetail({
    Key? key,
    required this.menus,
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
                "메뉴",
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
                itemCount: menus.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 110,
                    //margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${menus[index].name}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            const SizedBox(
                              height: 30,
                            ),
                            Text('${menus[index].price}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
