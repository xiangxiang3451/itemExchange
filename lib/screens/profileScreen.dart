import 'package:flutter/material.dart';
import 'package:item_exchange/screens/loginScreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Column(
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                      'https://gitee.com/chang-pengxiang/apk_test/raw/master/Avatar.png'), // Replace with your network image URL
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jennifer',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Georgia, USA',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const ListTile(
              leading: Icon(Icons.info, color: Color(0xFFF2625A)),
              title: Text(
                'Account Information',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.settings, color: Color(0xFFF2625A)),
              title: Text(
                'Account Setting',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.favorite, color: Color(0xFFF2625A)),
              title: Text(
                'Favorite Categories',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.history, color: Color(0xFFF2625A)),
              title: Text(
                'Transaction History',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.support, color: Color(0xFFF2625A)),
              title: Text(
                'Customer Support',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity, // 使按钮宽度与父级宽度相等
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnboardingScreen()), // 跳转到登录界面
                      (Route<dynamic> route) => false, // 清除所有路由
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF2625A),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, color: Colors.white), // 添加图标
                      SizedBox(width: 8), // 图标和文本之间的间距
                      Text(
                        'Sign out',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}