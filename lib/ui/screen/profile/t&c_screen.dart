import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_color.dart';

class TcScreen extends StatefulWidget {
  static const String routeName = "/tcScreen";
  const TcScreen({Key? key}) : super(key: key);

  @override
  State<TcScreen> createState() => _TcScreenState();
}

class _TcScreenState extends State<TcScreen> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Column(
          children: [
            // CarouselIndicator(),
            Divider(thickness: 2),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: RawScrollbar(
                  trackColor: Color(0xffD9D9D9),
                  thumbColor: AppColor.kPrimaryGreen,
                  radius: Radius.circular(20),
                  thickness: 5,
                  // radius: Radius.circular(20),
                  // thickness: 7,
                  isAlwaysShown: true,
                  trackVisibility: true,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: const [
                          SizedBox(height: 30),
                          Text(
                            "Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC.",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.. comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC.",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.. comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et.  reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et. reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(90),
      child: Padding(
        padding: EdgeInsets.only(right: 15, top: 50, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Terms of Service",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Spacer(),
                Icon(Icons.mic_none, size: 28),
              ],
            ),
            Text(
              "Last updated on August 2022",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
