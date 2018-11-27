import 'dart:io';

import 'package:flutter/material.dart';

void main() =>runApp(new ImagePage());


/**
 * Image Widget Demo
 * 1. image.asset(...)
 * 2. image.file(...)
 * 3. image.network(...)
 * 4. image.memory(...)   (较少使用)
 * 5. image(...)   （默认构造函数使用少）
 *
 * 可参考资料：
 * https://blog.csdn.net/poorkick/article/details/80458707
 */
class ImagePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Widget'),
        ),
        body: ListView(
          children: <Widget>[
        new Directionality(
        textDirection: TextDirection.ltr,
          child: AssetImageWidget(),
        ),
          new Directionality(
            textDirection: TextDirection.rtl,
            child:  AssetImageWidget(),
          ),
            FileImageWidget(),
            NetworkImageWidget(),
          ],
        ),
      ),
    );
  }

}
/**
 * 加载Asset资源的图片
 * 需在pubspec.yaml文件增加：（images就是放图片的文件夹）
 *
    assets:
    - images/
 */
class AssetImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.asset("images/realmadrid.jpg",
      //语义标签 类似android的 contentDescription属性
      semanticLabel: 'RealMadrid',
      excludeFromSemantics: true,
      width: 200.0,
      height: 200.0,
      /**
       * color和colorBlendMode一般配合使用，
       * BlendMode, 为混合模式的意思，包含如下诸多模式。
       * 和Android中Xfermode是一个原理。
       */
      //图片颜色 直接使用会掩盖Image图片的内容
      color: Color.fromARGB(80, 50, 200, 60),
      //颜色混合模式: BlendMode 枚举类
      colorBlendMode: BlendMode.colorBurn,
        /**
         * 是否拉伸，包含处理
         * BoxFit 枚举类
         * BoxFit.fill:全图显示，显示可能拉伸，充满
         * BoxFit.contain:全图显示，显示原比例，不需充满
         * BoxFit.cover:显示可能拉伸，可能裁剪，充满
         * BoxFit.fitWidth:显示可能拉伸，可能裁剪，宽度充满
         * BoxFit.fitHeight:显示可能拉伸，可能裁剪，高度充满
         * BoxFit.scaleDown:效果和contain差不多,但是此属性不允许显示超过源图片大小，可小不可大
         * BoxFit.none
         */

      fit: BoxFit.contain,
      //对齐方式
//      alignment: Alignment.center,
      //重复模式
      //repeat: ImageRepeat.repeatX,
      /**
       * 中心缩放
       * The center slice for a nine-patch image.(理解成我们在图片内部定义来一个点9文件用作拉伸。)
       * 只有在显示大小大于原图大小的情况下，才允许使用这个属性，否则会报错
      **/
      //centerSlice: Rect.fromCircle(center: const Offset(100.0, 100.0), radius: 10.0),
      /**
       * matchTextDirection
       * 该属性可生成镜像图片
       *
       * If this is true, there must be an ambient [Directionality] widget inscope.
       * 要与Directionality配合使用
       */
      matchTextDirection: true,
      /**
       * 当ImageProvider发生变化后，重新加载图片的过程中，原图片的展示是否保留。
       * true,保留
       * false，不保留，直接空白等待下一张图片加载。
       *
       */
      gaplessPlayback: false,
    );
  }

}

/**
 * 加载File的图片
 * 需加 <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/> 权限
 */
class FileImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.file(File("/system/wallpaper/oem_bg/default_wallpaper.jpg"),
          width: 300,
        height: 200);

  }

}


/**
 *  加载网络图片
 */
class NetworkImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543314120841&di=0ee3a163651696a1f816afaa6bebc07a&imgtype=0&src=http%3A%2F%2Fimg.pptjia.com%2Fimage%2F20180117%2Ff4b76385a3ccdbac48893cc6418806d5.jpg",
        width: 300,
        height: 200);

  }

}