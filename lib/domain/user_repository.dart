
import 'package:fake_store/data/models/user_model.dart';

import '../data/services/api_services.dart';

class UserRepository {
  ApiServices apiServices;
  UserRepository(this.apiServices);

  Future<List<User>> getUser() async {
    return apiServices.getUsers();
  }
}