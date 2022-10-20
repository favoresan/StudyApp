import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:study_app/screens/main/menu_screen.dart';
import '../../configs/theme/app_colors.dart';
import '../../model/question_model.dart';
import '../../resources/functions.dart';
import '../../resources/provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final subjectList = ref.watch(subjectListProvider);
    return Scaffold(
        body: DecoratedBox(
      decoration: BoxDecoration(
        gradient: mainGradient(context),
      ),
      child: ZoomDrawer(
        borderRadius: 50,
        showShadow: false,
        angle: 0.0,
        style: DrawerStyle.defaultStyle,
        slideWidth: MediaQuery.of(context).size.width * 0.77,
        controller: drawerController,
        menuScreen: MenuScreen(),
        menuScreenWidth: double.infinity,
        mainScreen: Container(
          // width: double.infinity,
          // height: double.infinity,
          decoration: BoxDecoration(
            gradient: mainGradient(context),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          toggle();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/menuleft.svg',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.animation,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Hello mate',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'What Do You Want To Improve\nToday?',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    padding: EdgeInsets.all(20),
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: customScaffoldColor(context),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          // print(subjectList[index].description);
                          return subjectCont(
                            subjectList[index].imageUrl!,
                            subjectList[index].title,
                            subjectList[index].description,
                            subjectList[index].questionCount,
                            subjectList[index].timeSeconds,
                            subjectList[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 15,
                          );
                        },
                        itemCount: subjectList.length),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget subjectCont(String img, String subject, String desc, int qCount,
      int time, Subject paper) {
    return GestureDetector(
      onTap: () {
        navigateToQ(paper: paper, context: context);
      },
      child: Container(
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xfff85187).withOpacity(0.3),
                    ),
                    child: Image.network(img)),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        subject,
                        style: TextStyle(
                          color: Color(0xfff85187),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          overflow: TextOverflow.visible,
                          desc,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 90,
                    ),
                    Icon(
                      Icons.help_outline_sharp,
                      color: Color(0xfff85187),
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$qCount quizzes',
                      style: TextStyle(
                        color: Color(0xfff85187),
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.timer,
                      color: Color(0xfff85187),
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$time mins',
                      style: TextStyle(
                        color: Color(0xfff85187),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xfff85187),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    height: 40,
                    width: 60,
                    child: SvgPicture.asset(
                      'assets/icons/trophyoutline.svg',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
