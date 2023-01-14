import 'package:flutter/material.dart';

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 2, 171, 92),
                ),
                child: Text('닫기'))
          ],
        ),
      ),
    );
  }
}
