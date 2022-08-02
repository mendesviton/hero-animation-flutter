import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final double kMaxRadius = 32;
  final double kMinRadius = 128;
  final Interval opacityCurve =
      const Interval(0.1, 0.75, curve: Curves.fastOutSlowIn);

  RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return SizedBox(
      height: kMaxRadius * 2.0,
      // width: kMaxRadius * 1.0,
      child: Hero(
        tag: imageName,
        createRectTween: _createRectTween,
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Material(
              // color: Colors.green,
              child: InkWell(
            child: Image.asset(imageName),
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: opacityCurve.transform(animation.value),
                          child: _buildPage(context, imageName, description),
                        );
                      },
                    );
                  },
                ),
              );
            },
          )),
        ),
      ),
    );
  }

  Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      alignment: FractionalOffset.center,
      child: SizedBox(
        // height: kMaxRadius * 2,
        // width: kMaxRadius * 2,
        child: Hero(
          createRectTween: _createRectTween,
          tag: imageName,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              child: Image.asset(
                imageName,
                fit: BoxFit.contain,
              ),
              // color: Colors.blueAccent,
            ),
          ),
        ),
        // child: Hero(
        //     createRectTween: _createRectTween,
        //     tag: imageName,
        //     child: InkWell(
        //         onTap: () {
        //           Navigator.of(context).pop();
        //         },
        //         child: Image.asset(
        //           imageName,
        //         ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hero animation'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHero(context, 'assets/beachball-alpha.png', 'foase'),
            _buildHero(context, 'assets/binoculars-alpha.png', 'foaes'),
            _buildHero(context, 'assets/chair-alpha.png', 'fodase')
          ],
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  final double maxRadius;
  final double clipRectExtent;
  final Widget? child;

  const RadialExpansion({
    Key? key,
    required this.maxRadius,
    this.child,
  })  : clipRectExtent = 2 * (maxRadius / math.sqrt2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
          child: SizedBox(
        child: ClipRect(
          child: child,
        ),
      )),
    );
  }
}
