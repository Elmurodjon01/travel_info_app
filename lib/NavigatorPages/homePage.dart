import 'package:flutter/material.dart';
import 'package:flutter_cubit/reUsables/boldText.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/reUsables/intro_nonBoldText.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//tabbar and tabview works only when the class extended with TickerProviderMixin
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'img/balloning.png': 'Balloning',
    'img/hiking.png': 'Hiking',
    'img/kayaking.png': 'Kayaking',
    'img/snorkling.png': 'Snorkling'
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: ReusableText(text: 'Discover'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                controller: tabController,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    CircleTabIndicator(color: AppColors.mainColor, radious: 4),
                tabs: const [
                  Tab(
                    text: 'Places',
                  ),
                  Tab(
                    text: 'Inspiration',
                  ),
                  Tab(
                    text: 'Emotions',
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: const DecorationImage(
                            image: AssetImage(
                              'img/mountain.jpeg',
                            ),
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
                Text('hello'),
                Text('annyong'),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  text: 'Explore more',
                  size: 22,
                ),
                NonBoldText(text: 'See all', textColor: AppColors.textColor1),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(right: 50),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                              '${images.keys.elementAt(index)}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                          child: NonBoldText(
                        text: '${images.values.elementAt(index)}',
                        textColor: AppColors.textColor2,
                      )),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radious;
  CircleTabIndicator({required this.color, required this.radious});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radious: radious);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radious;
  _CirclePainter({required this.color, required this.radious});
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    //idk how it worked here
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radious / 2,
        configuration.size!.height - radious);
    canvas.drawCircle(offset + circleOffset, radious, paint);
  }
}
