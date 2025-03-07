import 'package:flutter/material.dart';
import 'package:item_exchange/screens/homeScreen.dart';
import 'package:item_exchange/viewmodels/postViewmodel.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    // 延迟调用 loadData
    Future.microtask(() {
      Provider.of<PostViewModel>(context, listen: false).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PostViewModel>(context);

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
                    icon: const Icon(Icons.arrow_back, color: Color(0xFFF2625A)),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false,
                      );
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
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Product name',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Lipstick',
                        border: InputBorder.none,
                      ),
                      onChanged: viewModel.updateProductName,
                      controller: viewModel.productNameController,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 8,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Description 0/500',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Tell people about your product',
                        border: InputBorder.none,
                      ),
                      onChanged: viewModel.updateDescription,
                      controller: viewModel.descriptionController,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 8,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Select Category/Product Type/Manufacturer',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Select',
                        border: InputBorder.none,
                      ),
                      onChanged: viewModel.updateCategory,
                      controller: viewModel.categoryController,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 8,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Item Condition',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        CheckboxListTile(
                          title: const Text('New'),
                          value: viewModel.post.itemCondition == 'New',
                          onChanged: (value) {
                            viewModel.updateItemCondition('New');
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('Like new'),
                          value: viewModel.post.itemCondition == 'Like new',
                          onChanged: (value) {
                            viewModel.updateItemCondition('Like new');
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('Pristine'),
                          value: viewModel.post.itemCondition == 'Pristine',
                          onChanged: (value) {
                            viewModel.updateItemCondition('Pristine');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 8,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Remarks',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Remarks',
                        border: InputBorder.none,
                      ),
                      onChanged: viewModel.updateRemarks,
                      controller: viewModel.remarksController,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 8,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              // 保存数据
                              await viewModel.saveData();

                              // 跳转到成功页面
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostSuccessScreen()),
                              );
                            } catch (e) {
                              // 错误处理
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Failed to save data: $e"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF2625A),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text(
                            'Post Now',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen()), // 跳转到主界面
                  (Route<dynamic> route) => false, // 清除所有路由
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
