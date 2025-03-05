import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Good morning!\n', // 第一行文本
                style: TextStyle(
                  fontSize: 20, // 设置字体大小为 24
                  fontWeight: FontWeight.bold, // 设置字体加粗
                  color: Colors.black, // 设置字体颜色
                ),
              ),
              TextSpan(
                text: 'Jennifer', // 第二行文本
                style: TextStyle(
                  fontSize: 13, // 设置字体大小为 18
                  fontWeight: FontWeight.normal, // 设置字体不加粗
                  color: Colors.black, // 设置字体颜色
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 在列表上方添加文字
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 左对齐
                children: [
                  // "Fresh New" 文本
                  const Text(
                    'Fresh New',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 3), // 添加间距
                  // 地址图标和文本
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on, // 地址图标
                        size: 10, // 图标大小
                        color: Colors.grey, // 图标颜色
                      ),
                      SizedBox(width: 4), // 图标和文本之间的间距
                      Text(
                        'Brooklyn, New York', // 假的地址文本
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

            // 使用 Wrap 实现两列布局
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 16.0, // 水平间距
                  runSpacing: 16.0, // 垂直间距
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: (MediaQuery.of(context).size.width - 48) /
                          2, // 计算卡片宽度
                      height: 280, // 固定卡片高度
                      child: _buildItemCard(index),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30,), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt, size: 30), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.message, size: 30), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30), label: ''),
        ],
        selectedItemColor: const Color(0xFFF2625A),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
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
          // 图片部分
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              'https://gitee.com/chang-pengxiang/apk_test/raw/master/img.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150, // 图片的高度（固定）
            ),
          ),
          // 描述部分
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
