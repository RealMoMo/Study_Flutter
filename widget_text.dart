import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/**
 * Study Text Widget Demo
 */
void main() => runApp(new WidgetMain());


class WidgetMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Widget Text'),
        ),
        body: new Center(
          child: new Container(
            child: new WidgetText(),
            color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }

}

class WidgetText extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new StateRichText();
  }
}

/**
 * 默认构造方法
 * 显示单一样式的文本
 */
class StateNormalText extends State<WidgetText>{
  final wordPair = WordPair.random();
  @override
  Widget build(BuildContext context) {
    return new Text(wordPair.asPascalCase,
      //TextStyle
      style: new TextStyle(
        inherit: false,
        //字体颜色
        color: Colors.redAccent,
        //字体大小
        fontSize: 20.0,
        //字体粗细 默认是FontWeight.w400
        fontWeight: FontWeight.w800,
        //normal(使用直立的字形)或者italic(使用专为倾斜而设计的字形)
        fontStyle: FontStyle.italic,
        //字母间隔 & 中文字间隔 (负值可以更紧凑)
        //letterSpacing: 20.0,
        //单词间隔（本Demo没效果）
        //wordSpacing:  20.0,
        //文本绘制基线(alphabetic/ideographic)
        textBaseline: TextBaseline.ideographic,
        //在Text控件上时,行高（会乘以fontSize,所以不宜设置过大）
        height: 2.0,
        /**
         * 文字装饰
         * TextDecoration.none
         * TextDecoration.lineThrough 删除线
         * TextDecoration.overline  顶部划线
         * TextDecoration.underline 底部划线
         */
        decoration: TextDecoration.underline,
        //文字装饰的颜色
        decorationColor: Colors.blue,
        /**
         * 文字装饰style
         * TextDecorationStyle.wavy 波浪线
         * TextDecorationStyle.dashed  虚线
         * TextDecorationStyle.dotted  点线
         * TextDecorationStyle.double 双划线
         * TextDecorationStyle.solid  实线（默认）
         */
        decorationStyle: TextDecorationStyle.solid,

      ),
      //文本对齐方式
      textAlign: TextAlign.center,
      //文本方向
      textDirection: TextDirection.ltr,
      /**
       * 是否自动换行
       * 默认是true  from DefaultTextStyle可见
       * 若为false，文字将不考虑容器大小，单行显示，超出屏幕部分将默认截断处理
       */
      softWrap: false,
      /**
       * 文字超出屏幕时的处理方式
       * clip截断,fade渐隐,ellipsis省略号(ellipsis需要设置maxLines = 1或者softWrap = false))
       */
      overflow: TextOverflow.ellipsis,
      //字体显示倍率，字体最终大小=TextStyle.fontSize*倍率
      textScaleFactor: 2.0,
      //最大行数设置
      maxLines: 1,
    );
  }

}

/**
 * 构造方法二：
 * Text.rich(this.textSpan,...)
 * 显示丰富样式的文本
 * textSpan的textStyle与text的textStyle同时存在，会使用text的textStyle
 *
 *
 const TextSpan({
    this.style,
    this.text,
    this.children,
    this.recognizer,
    });

    children默认用style，除非children自身定义一个style.
 *
 */
class StateRichText extends State<WidgetText>{

  final wordPairList = generateWordPairs().take(10);
  @override
  Widget build(BuildContext context) {
    return new Text.rich(
      new TextSpan(
        text: 'Rich Text',
        style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          decoration: TextDecoration.none,
        ),
        children: <TextSpan>[
          new TextSpan(
            text: wordPairList.elementAt(0).asPascalCase,
          ),
          new TextSpan(
            text: wordPairList.elementAt(1).asPascalCase,
          ),
          new TextSpan(
            text: wordPairList.elementAt(2).asPascalCase,
          ),
          new TextSpan(
            text: wordPairList.elementAt(3).asPascalCase,
            style: new TextStyle(
              color: Colors.yellow,
              fontSize: 10.0,
            ),
            recognizer:new TapGestureRecognizer()..onTap=(){//增加一个点击事件
              debugPrint('Click this last word');
            },
          ),
        ],
      ),

      //TextStyle
//      style: new TextStyle(
//        inherit: false,
//        //字体颜色
//        color: Colors.redAccent,
//        //字体大小
//        fontSize: 20.0,
//        //字体粗细 默认是FontWeight.w400
//        fontWeight: FontWeight.w800,
//        //normal(使用直立的字形)或者italic(使用专为倾斜而设计的字形)
//        fontStyle: FontStyle.italic,
//        //字母间隔 & 中文字间隔 (负值可以更紧凑)
//        //letterSpacing: 20.0,
//        //单词间隔（本Demo没效果）
//        //wordSpacing:  20.0,
//        //文本绘制基线(alphabetic/ideographic)
//        textBaseline: TextBaseline.ideographic,
//        //在Text控件上时,行高（会乘以fontSize,所以不宜设置过大）
//        height: 2.0,
//        /**
//         * 文字装饰
//         * TextDecoration.none
//         * TextDecoration.lineThrough 删除线
//         * TextDecoration.overline  顶部划线
//         * TextDecoration.underline 底部划线
//         */
//        decoration: TextDecoration.underline,
//        //文字装饰的颜色
//        decorationColor: Colors.blue,
//        /**
//         * 文字装饰style
//         * TextDecorationStyle.wavy 波浪线
//         * TextDecorationStyle.dashed  虚线
//         * TextDecorationStyle.dotted  点线
//         * TextDecorationStyle.double 双划线
//         * TextDecorationStyle.solid  实线（默认）
//         */
//        decorationStyle: TextDecorationStyle.solid,
//
//      ),
      //文本对齐方式
      textAlign: TextAlign.center,
      //文本方向
      textDirection: TextDirection.ltr,
      /**
       * 是否自动换行
       * 默认是true  from DefaultTextStyle可见
       * 若为false，文字将不考虑容器大小，单行显示，超出屏幕部分将默认截断处理
       */
      softWrap: false,
      /**
       * 文字超出屏幕时的处理方式
       * clip截断,fade渐隐,ellipsis省略号(ellipsis需要设置maxLines = 1或者softWrap = false))
       */
      overflow: TextOverflow.ellipsis,
      //字体显示倍率，字体最终大小=TextStyle.fontSize*倍率
      textScaleFactor: 2.0,
      //最大行数设置
      maxLines: 1,
    );
  }

}