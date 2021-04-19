import 'dart:async';

class AuthBloc {
  StreamController _nameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _buyController = new StreamController();
  StreamController _addressController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get buyStream => _buyController.stream;
  Stream get addressStream => _addressController.stream;

  bool Forget(String email) {
    if (email == null || email.length == 0) {
      _emailController.sink.addError("Nhập email");
      return false;
    }
    _emailController.sink.add("");
    return true;
  }

  bool Login(String email, String pass) {
    if (email == null || email.length == 0) {
      _emailController.sink.addError("Nhập email");
      return false;
    }
    _emailController.sink.add("");

    if (pass.length < 1) {
      _passController.sink.addError(" Nhập mật khẩu ");
      return false;
    }
    _passController.sink.add("");

    return true;
  }

  bool isValid(String name, String email, String pass, String phone) {
    if (name == null || name.length == 0) {
      _nameController.sink.addError("Nhập tên");
      return false;
    }
    _nameController.sink.add("");

    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError("Nhập số điện thoại");
      return false;
    }
    _phoneController.sink.add("");

    if (email == null || email.length == 0) {
      _emailController.sink.addError("Nhập email");
      return false;
    }
    _emailController.sink.add("");

    if (pass.length < 1) {
      _passController.sink.addError(" Nhập mật khẩu ");
      return false;
    }
    if (pass.length < 6) {
      _passController.sink.addError("Mật khẩu phải trên 5 ký tự");
      return false;
    }
    _passController.sink.add("");

    return true;
  }

  // void signUp(String email, String pass, String phone, String name,
  //     Function onSuccess) {
  //   _firAuth.signUp(email, pass, name, phone, onSuccess);
  // }
  //
  // void signIn(String email, String pass, Function onSuccess,
  //     Function(String) onSignInError) {
  //   _firAuth.signIn(email, pass, onSuccess, onSignInError);
  // }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _passController.close();
    _phoneController.close();
    _buyController.close();
    _addressController.close();
  }
}
