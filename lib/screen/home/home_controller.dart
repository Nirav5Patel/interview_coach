import 'package:get/get.dart';

class HomeController extends GetxController{

  List<Map<String,dynamic>> roles=[
    {'label': 'Flutter Dev', 'icon': '📱'},
    {'label': 'Backend Eng', 'icon': '⚙️'},
    {'label': 'Frontend Dev', 'icon': '🌐'},
    {'label': 'Full Stack Dev', 'icon': '🔗'},
    {'label': 'Product Manager', 'icon': '📊'},
    {'label': 'Data Scientist', 'icon': '🤖'},
  ];

  List<String> difficulties = ["Entry","Mid","Senior"];

  RxString selectedRole = ''.obs;
  RxString selectedDifficulty = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}