abstract class AuthService {
  void login();
  void register();
  void sendOtp();
  void resetPassword();
}

abstract class TodoCategoryService {
  void createCat();
  void deleteCat();
  void rename();
}

abstract class TodoService {
  void createTodo() {}
  void deleteTodo();
  void updateTodo();
  void changeStatus();
}
