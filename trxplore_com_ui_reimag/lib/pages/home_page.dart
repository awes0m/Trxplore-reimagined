import 'package:flutter/material.dart';
import 'package:trxplore_com_ui_reimag/misc/colors.dart';
import 'package:trxplore_com_ui_reimag/utils/app_large_text.dart';
import 'package:trxplore_com_ui_reimag/utils/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //Header
        Container(
          padding: const EdgeInsets.only(top: 50, left: 20),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.menu,
                size: 30,
                color: Colors.black,
              ),
              const Expanded(child: SizedBox()),
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        //Heading
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const AppLargetext(text: 'Discover'),
        ),
        //TabBar
        SizedBox(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicator: const CircleTabIndicator(
                color: AppColors.mainColor,
                radius: 4,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              controller: _tabController,
              tabs: const [
                Tab(
                  child: Text(
                    'Places',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'Inspiration',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'Emotions',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
        //tabBar view
        Container(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          height: 300,
          width: double.maxFinite,
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 20, top: 10),
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('assets/img/mountain.jpeg'),
                            fit: BoxFit.cover),
                      ),
                    );
                  }),
              const Center(
                child: Text('Live'),
              ),
              const Center(
                child: Text('Explore'),
              ),
            ],
          ),
        ),
        //Explore more Row
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppLargetext(
                text: 'Explore more',
                size: 22,
              ),
              AppText(
                text: 'see all',
                color: AppColors.textColor1,
              )
            ],
          ),
        ),
        //category Row
        const SizedBox(height: 10),
        Container(
          height: 120,
          width: double.maxFinite,
          margin: const EdgeInsets.only(left: 20),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      //image Container
                      Container(
                        // margin: const EdgeInsets.only(right: 50),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/img/' + images.keys.elementAt(index)),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //text Container
                      SizedBox(
                        // margin: const EdgeInsets.only(right: 20),
                        child: AppText(
                          text: images.values.elementAt(index),
                          color: AppColors.textColor1,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
      ]),
    );
  }
}

//creating a Circular tab bar indicator
class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    _paint.strokeWidth = 2;
    _paint.style = PaintingStyle.fill;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius / 2);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
