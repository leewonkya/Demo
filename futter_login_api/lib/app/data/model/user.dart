import 'package:get/get.dart';

class RxUserModel {
  final id = 0.obs;
  final nome = 'nome'.obs;
}

class UserModel {
  UserModel({id, nome});

  final rx = RxUserModel();

  get nome => rx.nome.value;
  set nome(value) => rx.nome.value = value;

  get id => rx.id.value;
  set id(value) => rx.id.value = value;

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    return data;
  }
}
