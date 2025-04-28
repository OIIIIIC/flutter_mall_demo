import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  _ShopSearchBarState createState() => _ShopSearchBarState();
}

class _ShopSearchBarState extends State<HomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 255, 232, 232),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.only(left: 5),
        child: const Row(children: [
          const Icon(Icons.search, color: Colors.grey),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              '搜索你要找的商品',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ]),
      ),
    );
  }
}
