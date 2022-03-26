import 'package:flutter/material.dart';

class timelinepage extends StatefulWidget {
  const timelinepage({Key? key}) : super(key: key);

  @override
  State<timelinepage> createState() => _timelinepageState();
}

class _timelinepageState extends State<timelinepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
             Container(decoration: BoxDecoration(gradient: LinearGradient(
                  colors: [
                    Color(0xFFEF5350),
                Colors.redAccent,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            height: 300,
            width: 403,
            ),

            Column(
              children: [
                
                    Container(height: 130,),
                Row(
                  children: [
                    Container(width: 30,),
                    Text("Emergency\n Request sent!",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w500),),
                  ],
                ),
                
                    Container(height: 30,),
                     Row(
                       children: [
                    Container(width: 25,),
                         Text("Please stay calm \n Help will reach p\out you soon!",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
                       ],
                     ),
              ],
            )
          ],),
          Column(
            children: [
              Container(height: 10,),
              Row(
                           children: [
                        Container(width: 25,),
                             Text("What next?",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                           ],
                         ),
            ],
          ),


          Timeline(
            children: <Widget>[
              Container(height:70,child: Center(child: const Text("You will recieve a call from control room",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),))),
             Container(
               height:70,
               child: Center(
                 child: Column(
                   children: [
                     Text("Responder will reach your location/seat",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                      InkWell(child: Text("Update location",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w400),)),
                   ],
                 ),
               ),
             ),
              Container(
               height:70,
                child: Center(
                  child: Text("Responder will help you get out of the situation and take necessary actions",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                ),
              ),         
               Container(
               height:70,
                child: Center(
                  child: Text("Responder will help you get out of the situation and take necessary actions",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                ),
              ),    
            ],
            indicators: <Widget>[
              Icon(Icons.circle_outlined,color: Colors.black54,),
              Icon(Icons.circle_outlined,color: Colors.black54,),
              Icon(Icons.circle_outlined,color: Colors.black54,),
              Icon(Icons.circle_outlined,color: Colors.black54,),
            ],
          ),
          SizedBox(height: 30,),
          capturing()
        ],
      ),
    );
  }





}
class Timeline extends StatelessWidget {
  const Timeline({
    Key? key,
    required this.children,
    this.indicators,
    this.isLeftAligned = true,
    this.itemGap = 12.0,
    this.gutterSpacing = 4.0,
    this.padding = const EdgeInsets.all(8),
    this.controller,
    this.lineColor = Colors.grey,
    this.physics,
    this.shrinkWrap = true,
    this.primary = false,
    this.reverse = false,
    this.indicatorSize = 30.0,
    this.lineGap = 4.0,
    this.indicatorColor = Colors.blue,
    this.indicatorStyle = PaintingStyle.fill,
    this.strokeCap = StrokeCap.butt,
    this.strokeWidth = 2.0,
    this.style = PaintingStyle.stroke,
  })  : itemCount = children.length,
        assert(itemGap >= 0),
        assert(lineGap >= 0),
        assert(indicators == null || children.length == indicators.length),
        super(key: key);

  final List<Widget> children;
  final double itemGap;
  final double gutterSpacing;
  final List<Widget>? indicators;
  final bool isLeftAligned;
  final EdgeInsets padding;
  final ScrollController? controller;
  final int itemCount;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  final Color lineColor;
  final double lineGap;
  final double indicatorSize;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      separatorBuilder: (_, __) => SizedBox(height: itemGap),
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      controller: controller,
      reverse: reverse,
      primary: primary,
      itemBuilder: (context, index) {
        final child = children[index];
        final _indicators = indicators;

        Widget? indicator;
        if (_indicators != null) {
          indicator = _indicators[index];
        }

        final isFirst = index == 0;
        final isLast = index == itemCount - 1;

        final timelineTile = <Widget>[
          CustomPaint(
            foregroundPainter: _TimelinePainter(
              hideDefaultIndicator: indicator != null,
              lineColor: lineColor,
              indicatorColor: indicatorColor,
              indicatorSize: indicatorSize,
              indicatorStyle: indicatorStyle,
              isFirst: isFirst,
              isLast: isLast,
              lineGap: lineGap,
              strokeCap: strokeCap,
              strokeWidth: strokeWidth,
              style: style,
              itemGap: itemGap,
            ),
            child: SizedBox(
              height: double.infinity,
              width: indicatorSize,
              child: indicator,
            ),
          ),
          SizedBox(width: gutterSpacing),
          Expanded(child: child),
        ];

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
                isLeftAligned ? timelineTile : timelineTile.reversed.toList(),
          ),
        );
      },
    );
  }
}

class _TimelinePainter extends CustomPainter {
  _TimelinePainter({
    required this.hideDefaultIndicator,
    required this.indicatorColor,
    required this.indicatorStyle,
    required this.indicatorSize,
    required this.lineGap,
    required this.strokeCap,
    required this.strokeWidth,
    required this.style,
    required this.lineColor,
    required this.isFirst,
    required this.isLast,
    required this.itemGap,
  })  : linePaint = Paint()
          ..color = lineColor
          ..strokeCap = strokeCap
          ..strokeWidth = strokeWidth
          ..style = style,
        circlePaint = Paint()
          ..color = indicatorColor
          ..style = indicatorStyle;

  final bool hideDefaultIndicator;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Paint linePaint;
  final Paint circlePaint;
  final bool isFirst;
  final bool isLast;
  final double itemGap;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    final halfItemGap = itemGap / 2;
    final indicatorMargin = indicatorRadius + lineGap;

    final top = size.topLeft(Offset(indicatorRadius, 0.0 - halfItemGap));
    final centerTop = size.centerLeft(
      Offset(indicatorRadius, -indicatorMargin),
    );

    final bottom = size.bottomLeft(Offset(indicatorRadius, 0.0 + halfItemGap));
    final centerBottom = size.centerLeft(
      Offset(indicatorRadius, indicatorMargin),
    );

    if (!isFirst) canvas.drawLine(top, centerTop, linePaint);
    if (!isLast) canvas.drawLine(centerBottom, bottom, linePaint);

    if (!hideDefaultIndicator) {
      final Offset offsetCenter = size.centerLeft(Offset(indicatorRadius, 0));

      canvas.drawCircle(offsetCenter, indicatorRadius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class capturing extends StatelessWidget {
  const capturing({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
               Text("Capture what is going aroud you!",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
SizedBox(height: 30,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Column(
      children: [
        Container(child:
                  Icon(Icons.mic,color: Colors.white,),height:50,width:50,decoration: BoxDecoration(color: Colors.blueGrey[400],borderRadius: BorderRadius.circular(10)),),
                     Text("Record",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),

      ],
    ),
    Column(
      children: [
        Container(child:
                  Icon(Icons.video_camera_back_rounded,color: Colors.white,),height:50,width:50,decoration: BoxDecoration(color: Colors.blueGrey[400],borderRadius: BorderRadius.circular(10)),),
                          Text("Video",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),

      ],
    ),
    Column(
      children: [
        Container(child:
                  Icon(Icons.photo_camera,color: Colors.white,),height:50,width:50,decoration: BoxDecoration(color: Colors.blueGrey[400],borderRadius: BorderRadius.circular(10)),),
  
                       Text("Photo",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
    ],
    ),
  ],
)
      ],
    );
  }
}