// 导入 carousel_slider 包，用于实现图片轮播功能
import 'package:carousel_slider/carousel_slider.dart';
// 导入 flutter/foundation.dart 包，提供一些基础功能，如 kDebugMode
import 'package:flutter/foundation.dart';
// 导入 flutter/material.dart 包，提供 Flutter 材料设计组件
import 'package:flutter/material.dart';

/// 定义一个无状态组件 HomeBanner，用于展示轮播图
class HomeBanner extends StatelessWidget {
  /// 构造函数，接收一个必需的参数 bannerList，用于存储轮播图数据
  const HomeBanner({super.key, required this.bannerList});

  // 定义列表接收父组件传值，存储轮播图相关数据
  final List bannerList;

  @override
  Widget build(BuildContext context) {
    // 检查 bannerList 是否为空
    if (bannerList.isNotEmpty) {
      // 如果不为空，返回一个 CarouselSlider 组件来展示轮播图
      return CarouselSlider(
          // items 参数，用于定义轮播图的每个项目
          items: bannerList
              .map((item) => GestureDetector(
                    // 点击操作，当用户点击轮播图时触发
                    onTap: () {
                      // 如果处于调试模式，打印点击的图片信息
                      if (kDebugMode) {
                        print('点击了, id:${item['imgName']}');
                      }
                    },
                    // 每个轮播图项目的子组件
                    child: Container(
                      // 设置容器的外边距
                      margin: const EdgeInsets.all(5),
                      child: Image.network(
                        // 图片的网络地址
                        item['imgUrl'],
                        // 设置图片的填充方式
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
              .toList(),
          // 常用配置，设置 CarouselSlider 的参数
          options: CarouselOptions(
            // 开启自动播放功能
            autoPlay: true,
            // 设置自动播放的间隔时间为 2 秒
            autoPlayInterval: const Duration(seconds: 3),
            // 设置轮播图的高度，这里可以根据需求调整
            height: 200,
          ));
    } else {
      // 如果 bannerList 为空，返回一个空的 Container
      return Container();
    }
  }
}
