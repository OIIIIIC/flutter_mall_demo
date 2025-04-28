import 'package:flutter/material.dart';

class HomeShopList extends StatelessWidget {
  const HomeShopList({super.key, required this.goodsList});

  final List goodsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Map item = goodsList[index];
          return Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            height: 120,
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.network(
                    '${item['goods_image']}',
                    width: 100,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${item['goods_name']}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "已售${item['goods_sales']}件",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 107, 98, 98)),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          Text(
                            "¥${item['goods_price_min']}",
                            style: const TextStyle(color: Colors.red),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "¥${item['line_price_min']}",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 107, 98, 98),
                                  decoration: TextDecoration.lineThrough),
                            ),
                          )
                        ],
                      ))
                    ],
                  )),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 10,
            color: const Color.fromARGB(255, 239, 232, 232),
          );
        },
        itemCount: goodsList.length);
  }
}
