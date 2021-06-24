import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/base/base_state.dart';
import 'package:flutter_app/pages/main/interface/main_view.dart';
import 'package:flutter_app/pages/main/presenter/main_presenter.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() {
    return _MainPageState();
  }
}

class _MainPageState extends BaseState<MainPage, MainPresenter>
    with SingleTickerProviderStateMixin
    implements IMainView {
  List<String> swiperListData = [
    "https://t7.baidu.com/it/u=3691080281,11347921&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=1285847167,3193778276&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=3251197759,2520670799&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=602106375,407124525&fm=193&f=GIF"
  ];
  List<String> stringData = [
    "https://t7.baidu.com/it/u=369108028111347921&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=12858471673193778276&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=32511977592520670799&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=602106375407124525&fm=193&f=GIF"
  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.width * 9 / 16,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(""),
              background: Swiper(
                itemBuilder: (context, index) =>
                    Image.network(swiperListData[index]),
                itemCount: swiperListData.length,
                autoplay: true,
                autoplayDelay: 1500,
                duration: 1000,
                pagination: new SwiperPagination(),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              Container(
                height: 48,
                margin: EdgeInsets.only(top: 12, left: 16, right: 16),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.volume_down_outlined),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Swiper(
                        itemBuilder: (context, index) => Row(
                          children: [
                            Expanded(
                              child: Text(
                                stringData[index],
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        itemCount: stringData.length,
                        scrollDirection: Axis.vertical,
                        autoplay: true,
                        duration: 1000,
                        autoplayDelay: 1500,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (context, index) => TextButton(
                  onPressed: () => null,
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    child: Center(
                      child: Text(
                        'grid ${index + 1}',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey[200];
                        }
                        //默认状态使用灰色
                        return Colors.white;
                      })),
                ),
                itemCount: 8,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => Container(
                  height: 48,
                  color: Colors.white,
                  child: Text("条目 ${index + 1}"),
                ),
                itemCount: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              )
            ]),
          ),
        ],
      ),
    );
  }

  @override
  MainPresenter createPresenter() {
    return MainPresenter();
  }
}
