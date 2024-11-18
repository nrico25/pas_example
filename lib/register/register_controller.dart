import 'package:get/get.dart';
import 'package:pas_example/register/register_apiService.dart';

class RegisterController extends GetxController {
  final RegisterService _registerService = RegisterService();

  var isLoading = false.obs;
  var message = ''.obs;

  Future<bool> registerUser(String username, String password, String fullName, String email) async {
    isLoading.value = true;
    message.value = '';

    final response = await _registerService.registerUser(username, password, fullName, email);

    if (response.status == true) {
      message.value = response.message ?? 'Account Created Successfully';
    } else {
      message.value = response.message ?? 'Failed to create account';
    }

    isLoading.value = false;
    return response.status;
  }
}