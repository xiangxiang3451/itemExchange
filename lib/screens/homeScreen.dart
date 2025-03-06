import 'package:flutter/material.dart';
import 'package:item_exchange/screens/postScreen.dart';
import 'package:item_exchange/screens/searchScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // 当前选中的底部导航栏索引

  final List<Widget> _pages = [
    HomeContent(), // 主页内容
    SearchScreen(), // 搜索页面
    PostScreen(),

  ];

  void _onItemTapped(int index) {
    if (index == 2) { // 相机图标的索引是 2
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostScreen()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _selectedIndex == 0
          ? AppBar(
              title: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Good morning!\n',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Jennifer',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://gitee.com/chang-pengxiang/apk_test/raw/master/Avatar.png'),
                ),
              ),
            )
          : null, // 只有在主页显示 AppBar
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed, // 固定导航栏布局
        selectedItemColor: const Color(0xFFF2625A), // 选中图标颜色
        unselectedItemColor: Colors.grey, // 未选中图标颜色
        backgroundColor: Colors.white, // 导航栏背景颜色
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30), // 主页图标
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30), // 搜索图标
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildCustomCameraIcon(), // 自定义相机图标
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 30), // 消息图标
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30), // 个人图标
            label: '',
          ),
        ],
      ),
    );
  }

  // 自定义相机图标
  Widget _buildCustomCameraIcon() {
    return Container(
      width: 60, // 图标容器宽度
      height: 60, // 图标容器高度
      decoration: BoxDecoration(
        color: const Color(0xFFF2625A), // 圆形背景颜色
        shape: BoxShape.circle, // 圆形
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Icon(
        Icons.camera_alt,
        size: 30, // 相机图标大小
        color: Colors.white, // 相机图标颜色
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fresh New',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 10,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Brooklyn, New York',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width - 48) / 2,
                    height: 280,
                    child: _buildItemCard(index),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard(int index) {
    List<String> titles = [
      'Beats by Dr.Dre',
      'Flower Vase',
      'Studio 3 Wireless',
      'Farmhouse',
      'Ceramic Flower',
      'Round Wall Clock'
    ];
    List<String> conditions = [
      'Near Mint',
      'New',
      'Used',
      'New',
      'Used',
      'Quartz'
    ];
    List<String> distances = [
      '0.5 mi',
      '0.8 mi',
      '1.8 mi',
      '2.5 mi',
      '1.0 mi',
      '0.7 mi'
    ];

    return Card(
      color: const Color.fromARGB(255, 253, 234, 215),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              'https://gitee.com/chang-pengxiang/apk_test/raw/master/img.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titles[index],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Conditions: ${conditions[index]}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  distances[index],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}