import 'package:flutter/material.dart';
import 'package:item_exchange/localStorageService/sharedPreferences.dart';
import 'package:item_exchange/model/postModel.dart';

class PostViewModel with ChangeNotifier {
  final LocalStorageService _storage = LocalStorageService();
  Post _post = Post();

  // TextEditingController
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  Post get post => _post;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // 初始化时加载数据
  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    await _storage.init();
    _post.productName = _storage.loadString('productName') ?? '';
    _post.description = _storage.loadString('description') ?? '';
    _post.category = _storage.loadString('category') ?? '';
    _post.itemCondition = _storage.loadString('itemCondition') ?? '';
    _post.remarks = _storage.loadString('remarks') ?? '';

    // 更新控制器的值
    productNameController.text = _post.productName;
    descriptionController.text = _post.description;
    categoryController.text = _post.category;
    remarksController.text = _post.remarks;

    _isLoading = false;
    notifyListeners();
  }

  // 保存数据
  Future<void> saveData() async {
    await _storage.init();
    await _storage.saveString('productName', _post.productName);
    await _storage.saveString('description', _post.description);
    await _storage.saveString('category', _post.category);
    await _storage.saveString('itemCondition', _post.itemCondition);
    await _storage.saveString('remarks', _post.remarks);
  }

  // 更新数据
  void updateProductName(String value) {
    _post.productName = value;
    notifyListeners();
  }

  void updateDescription(String value) {
    _post.description = value;
    notifyListeners();
  }

  void updateCategory(String value) {
    _post.category = value;
    notifyListeners();
  }

  void updateItemCondition(String value) {
    _post.itemCondition = value;
    notifyListeners();
  }

  void updateRemarks(String value) {
    _post.remarks = value;
    notifyListeners();
  }

  @override
  void dispose() {
    // 释放控制器
    productNameController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
    remarksController.dispose();
    super.dispose();
  }
}