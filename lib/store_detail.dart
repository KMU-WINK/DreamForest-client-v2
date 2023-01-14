import 'package:flutter/material.dart';
import 'Store.dart';
import 'menu_detail.dart';

List<Menu> menus = [];

void addMenu(List<dynamic> menuMap){
    int i = 1;
    menuMap.forEach((menuList) { 
    menus.add(
      Menu(
        id: i,
        name : menuList['name'],
        price : menuList['price']
      )
    );
    i++;
  });
}
class StoreDetail extends StatelessWidget {
  final Store store;
  const StoreDetail({
    Key? key,
    required this.store,
  }): super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
              height: 400,
              child: Image.network(
                store.naverMenuImages == 'null' ? 'https://media.istockphoto.com/id/1357365823/vector/default-image-icon-vector-missing-picture-page-for-website-design-or-mobile-app-no-photo.jpg?b=1&s=170667a&w=0&k=20&c=LEhQ7Gji4-gllQqp80hLpQsLHlHLw61DoiVf7XJsSx0='
                            : store.naverMenuImages[0])),
              //Image.asset('assets/images/food.png', fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    store.storeName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Text(
                        store.type,
                        style: const TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(24.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text.rich(
                                  TextSpan(children: [
                                    const WidgetSpan(
                                        child: Icon(
                                      Icons.location_on,
                                      size: 18.0,
                                      color: Color.fromARGB(255, 2, 171, 92),
                                    )),
                                    TextSpan(text: store.roadAddress == 'null' ? ' 매장 주소 정보가 없습니다.'
                                    :' ${store.roadAddress}')
                                  ]),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text.rich(
                                  TextSpan(children: [
                                    const WidgetSpan(
                                        child: Icon(
                                      Icons.schedule,
                                      size: 18.0,
                                      color: Color.fromARGB(255, 2, 171, 92),
                                    )),
                                    TextSpan(text: store.naverBizHour == 'null' ? ' 매장 이용시간 정보가 없습니다.'
                                    : ' ${store.naverBizHour[0]['startTime']} ~ ${store.naverBizHour[0]['endTime']}')
                                  ]),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text.rich(
                                  TextSpan(children: [
                                    const WidgetSpan(
                                        child: Icon(
                                      Icons.call,
                                      size: 18.0,
                                      color: Color.fromARGB(255, 2, 171, 92),
                                    )),
                                    TextSpan(text: store.phoneNumber == 'null' ? ' 매장 연락처 정보가 없습니다.'
                                    :" ${store.phoneNumber}")
                                  ]),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(height: 8.0, color: Colors.grey),
                Container(
                  padding: const EdgeInsets.all(24.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        "메뉴",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(store.naverMenus == 'null' ? '메뉴가 없습니다.'
                            : store.naverMenus[0]['name'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(store.naverMenus == 'null' ? '메뉴가 없습니다.'
                            : store.naverMenus[0]['price'],
                            style: const TextStyle(
                              color: Color.fromARGB(255, 2, 171, 92),
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(store.naverMenus == 'null' ? '메뉴가 없습니다.'
                            : store.naverMenus[1]['name'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            store.naverMenus == 'null' ? '메뉴가 없습니다.'
                            : store.naverMenus[1]['price'],
                            style: const TextStyle(
                              color: Color.fromARGB(255, 2, 171, 92),
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            store.naverMenus == 'null' ? '메뉴가 없습니다.'
                            : store.naverMenus[2]['name'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            store.naverMenus == 'null' ? '메뉴가 없습니다.'
                            : store.naverMenus[2]['price'],
                            style: const TextStyle(
                              color: Color.fromARGB(255, 2, 171, 92),
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 2, 171, 92),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 32.0,
                      ),
                    ),
                    child: Text(
                      "메뉴 더보기",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      menus = [];
                      addMenu(store.naverMenus);
                      print(menus.toString());
                      if(menus != []){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MenuDetail(
                            menus : menus
                          )),
                        );
                      }
                      else{
                        
                      }
                      // menus = [];
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24.0),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "리뷰",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "고기가 맛있네요",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "사장님이 미쳤어요",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 2, 171, 92),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 32.0,
                      ),
                    ),
                    child: Text(
                      "리뷰 더보기",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
          ),
        ],
      ),
    );
  }
}
