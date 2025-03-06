import 'package:flutter/material.dart';
import 'package:item_exchange/screens/homeScreen.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            // 物品图片和返回按钮
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  child: Image.network(
                    'https://gitee.com/chang-pengxiang/apk_test/raw/master/Image.png',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 5,
                  child: IconButton(
                    icon:
                        const Icon(Icons.arrow_back, color: Color(0xFFF2625A)),
                    onPressed: () {
                      Navigator.pop(context); // 返回上一页
                    },
                  ),
                ),
              ],
            ),
            // 卡片
            Card(
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              elevation: 4,
              margin: EdgeInsets.zero, // 卡片与屏幕边缘无间距
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // 卡片内容与两边有 padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16), // 灰色留白
                    const Text(
                      'Product name',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8), // 空白
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Lipstick',
                        border: InputBorder.none, // 取消边框
                      ),
                    ),
                    const SizedBox(height: 16), // 灰色留白
                    Container(
                      width: double.infinity, // 占据整个宽度
                      height: 8,
                      color: Colors.grey.withOpacity(0.2), // 灰色背景
                    ),
                    const SizedBox(height: 16), // 灰色留白
                    const Text(
                      'Description 0/500',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8), // 空白
                    const TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Tell people about your product',
                        border: InputBorder.none, // 取消边框
                      ),
                    ),
                    const SizedBox(height: 16), // 灰色留白
                    Container(
                      width: double.infinity, // 占据整个宽度
                      height: 8,
                      color: Colors.grey.withOpacity(0.2), // 灰色背景
                    ),
                    const SizedBox(height: 16), // 灰色留白
                    const Text(
                      'Select Category/Product Type/Manufacturer',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8), // 空白
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Select',
                        border: InputBorder.none, // 取消边框
                      ),
                    ),
                    const SizedBox(height: 16), // 灰色留白
                    Container(
                      width: double.infinity, // 占据整个宽度
                      height: 8,
                      color: Colors.grey.withOpacity(0.2), // 灰色背景
                    ),
                    const SizedBox(height: 16), // 灰色留白
                    const Text(
                      'Item Condition',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8), // 空白
                    Column(
                      children: [
                        CheckboxListTile(
                          title: const Text('New'),
                          value: false,
                          onChanged: (value) {},
                        ),
                        CheckboxListTile(
                          title: const Text('Like new'),
                          value: false,
                          onChanged: (value) {},
                        ),
                        CheckboxListTile(
                          title: const Text('Pristine'),
                          value: false,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 16), // 灰色留白
                    Container(
                      width: double.infinity, // 占据整个宽度
                      height: 8,
                      color: Colors.grey.withOpacity(0.2), // 灰色背景
                    ),
                    const SizedBox(height: 16), // 灰色留白
                    const Text(
                      'Remarks',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8), // 空白
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Remarks',
                        border: InputBorder.none, // 取消边框
                      ),
                    ),
                    const SizedBox(height: 16), // 灰色留白
                    Container(
                      width: double.infinity, // 占据整个宽度
                      height: 8,
                      color: Colors.grey.withOpacity(0.2), // 灰色背景
                    ),
                    const SizedBox(height: 20), // 空白
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.7, // 按钮宽度为屏幕宽度的 0.7
                        child: ElevatedButton(
                          onPressed: () {
                            // 处理发布逻辑
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostSuccessScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF2625A),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15), // 垂直内边距
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0), // 设置圆角
                            ),
                          ),
                          child: const Text(
                            'Post Now',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // 空白
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://gitee.com/chang-pengxiang/apk_test/raw/master/Success%201.png',
              width: 200, // 设置图片宽度
              height: 200, // 设置图片高度
              fit: BoxFit.cover, // 图片填充方式
            ),
            const SizedBox(height: 20),
            const Text(
              'Post Successful',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF2625A),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "You've have successfully post new things!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen()), // 替换为你的主页
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF2625A),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Back to home',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
