import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'pages/home/index.dart';

class TabsCase extends StatefulWidget {
  const TabsCase({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabsCase> {
  // 导航栏数据
  List tabList = [
    {
      'label': '首页',
      'activeIcon': '/tabbar/home-active.png',
      'icon': '/tabbar/home.png',
    },
    {
      'label': '分类',
      'activeIcon': '/tabbar/cate-active.png',
      'icon': '/tabbar/cate.png',
    },
    {
      'label': '购物车',
      'activeIcon': '/tabbar/cart-active.png',
      'icon': '/tabbar/cart.png',
    },
    {
      'label': '我的',
      'activeIcon': '/tabbar/user-active.png',
      'icon': '/tabbar/user.png',
    }
  ];

  int _currentIndex = 0; //当前激活的选项索引

  //  第一种方法:PageView 可以根据索引显示不同的页面
  Widget getBody() {
    if (_currentIndex == 0) {
      return const Center(child: Text('首页'));
    } else if (_currentIndex == 1) {
      return const Center(child: Text('分类'));
    } else if (_currentIndex == 2) {
      return const Center(child: Text('购物车'));
    }
    return const Center(child: Text('我的'));
  }

  List<BottomNavigationBarItem> getTabBarList() {
    List<BottomNavigationBarItem> list = [];
    for (var i = 0; i < tabList.length; i++) {
      var item = tabList[i];
      list.add(BottomNavigationBarItem(
        label: item['label'],
        icon: Image.asset(tabList[i]['icon'], width: 40, height: 40),
        activeIcon: Image.asset(item['activeIcon'], width: 40, height: 40),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 第二种方法:IndexedStack 可以根据索引显示不同的页面
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          Center(child: HomePage()),
          Center(child: Text('分类')),
          Center(child: Text('购物车')),
          Center(child: Text('我的')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 固定底部导航栏
        items: getTabBarList(),
        selectedItemColor: Colors.blue, // 选中的颜色
        unselectedItemColor: Colors.black, // 未选中的颜色
        currentIndex: _currentIndex, // 当前激活的选项索引
        // 点击事件,点击切换选项卡
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
