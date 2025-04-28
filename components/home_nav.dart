import 'package:flutter/material.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({super.key, required this.navList});

  // 定义列表接收父组件传值
  final List navList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 1,
      ),
      itemCount: navList.length,
      // 处理listview嵌套报错
      shrinkWrap: true,
      // 构造子元素
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                Expanded(
                    child: Image.network(
                  navList[index]['imgUrl'],
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                )),
                Expanded(
                    child: Text(
                  navList[index]['text'],
                  style: const TextStyle(fontSize: 13),
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
