import 'package:deneme/models/users_model.dart';
import 'package:deneme/services/uretim_repository.dart';
import 'package:deneme/services/users_repository.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  var users = <UsersModel>[].obs;
  var isLoading = false.obs;
  var loggedInUser = Rxn<UsersModel>();
  var loginError = ''.obs;

  var enteredUsername = ''.obs;
  var enteredPassword = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      isLoading.value = true;
      users.value = await UsersRepository.fetchUsers();
    } catch (e) {
      loginError.value = "Veri alınamadı: $e";
    } finally {
      isLoading.value = false;
    }
  }

  bool login(String username, String password) {
    loginError.value = "";
    final normalizedPassword = normalizePassword(password);

    final user = users.firstWhereOrNull((u) =>
    u.username.toLowerCase().trim() == username.toLowerCase().trim() &&
        normalizePassword(u.password) == normalizedPassword);

    if (user != null) {
      loggedInUser.value = user;
      return true;
    } else {
      loginError.value = "Kullanıcı adı veya şifre yanlış.";
      loggedInUser.value = null;
      return false;
    }
  }

  String normalizePassword(String password) {
    return password.replaceAll(RegExp(r'[^0-9a-zA-Z]'), "").trim();
  }
}