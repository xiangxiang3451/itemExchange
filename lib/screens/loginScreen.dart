import 'package:flutter/material.dart';

// Onboarding 页面
class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
          crossAxisAlignment: CrossAxisAlignment.center, // 水平居中
          children: [
            // 图片
            Expanded(
              flex: 3, // 图片占据更多空间
              child: Center(
                child: Image.asset(
                  'assets/img_onboarding.png', // 替换为你的图片路径
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            // const SizedBox(height: 2),
            // 大标题
            const Text(
              'Welcome to Swapee',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF2625A), // 使用 #F2625A 颜色
              ),
            ),
            const SizedBox(height: 8),
            // 副标题
            const Text(
              'Help you trade second-hand goods\nconveniently',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(), // 将按钮推到页面底部
            // 按钮区域
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 注册按钮
                ElevatedButton(
                  onPressed: () {
                    // 导航到注册页面
                    Navigator.pushNamed(context, '/register');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE9ECEF), // 注册按钮颜色
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 设置圆角
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                // 登录按钮
                ElevatedButton(
                  onPressed: () {
                    // 导航到登录页面
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF2625A), // 使用 #F2625A 颜色
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 设置圆角
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white, // 文字颜色
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

// Login 页面
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Login",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black, // 默认文本颜色
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Not a member yet? '),
                  TextSpan(
                    text: 'Register now',
                    style: TextStyle(
                      color: Colors.red, // 设置 "Register now" 为红色
                      fontWeight: FontWeight.bold, // 可选：加粗
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Username',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Your user name',
                filled: true, // 启用背景填充
                fillColor: Color(0xFFF8F9FA), // 设置背景颜色为 #DEE2E6
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)), // 设置圆角
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)), // 设置圆角
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)), // 设置圆角
                  borderSide: BorderSide(color: Colors.blue), // 聚焦时边框颜色
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                filled: true, // 启用背景填充
                fillColor: Color(0xFFF8F9FA), // 设置背景颜色为 #DEE2E6
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)), // 设置圆角
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)), // 设置圆角
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)), // 设置圆角
                  borderSide: BorderSide(color: Colors.blue), // 聚焦时边框颜色
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // 处理登录逻辑
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF2625A),
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                 shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 设置圆角
                    ),    
              ),
              child: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 16),),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  // 导航到忘记密码页面
                },
                child: const Text(
                  'Forgot your password?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
