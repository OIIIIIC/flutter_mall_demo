import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../components/home_banner.dart';
import '../../components/home_nav.dart';
import '../../components/home_shop_list.dart';
import '../../components/shop_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. 定义字典存储接口数据
  Map resData = {};
  List bannerList = [];
  List navList = [];
  List adList = [];
  List goodsList = [];

  @override
  void initState() {
    getResData();
    super.initState();
  }

  // 2. 获取接口数据
  void getResData() async {
    Dio dio = Dio();
    Response res = await dio
        .get('http://smart-shop.itheima.net/index.php?s=/api/page/detail');
    setState(() {
      // 2.1 完整数据
      resData = res.data['data']['pageData'];
      // 2.2 轮播图数据
      bannerList = resData['items'][1]['data'];
      // 2.3 导航组数据
      navList = resData['items'][3]['data'];
      // 2.4 广告图片数据
      adList = resData['items'][4]['data'];
      // 2.5 猜你喜欢商品数据，需要根据实际接口返回结构调整索引
      // 这里假设商品数据在 items 数组的第 5 个元素中
      // goodsList = resData['items'][5]['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '智慧商城',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const HomeSearchBar(),
          HomeBanner(bannerList: bannerList),
          HomeNav(navList: navList),
          // 广告位
          adList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Image.network('${adList[0]['imgUrl']}'),
                )
              : Container(),
          // 富文本-猜你喜欢
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
              alignment: Alignment.center,
              child: const Text('—— 猜你喜欢 ——'),
            ),
          ),
          HomeShopList(goodsList: goodsList)
        ],
      ),
    );
  }
}
