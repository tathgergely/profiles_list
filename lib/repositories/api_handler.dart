import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:profiles_list/models/profile.dart';

class ApiHandler {
  late String _seed;

  ApiHandler() {
    refresh();
  }

  Future<List<Profile>?> fetch(int page, int results) async {
    final response = await http.get(Uri.parse(
        'https://randomuser.me/api/?page=$page&results=$results&seed=$_seed&exc=login,registered,dob,id,nat&noinfo'));

    if (response.statusCode == 200 || response.body != "") {
      return List<Profile>.from(jsonDecode(response.body)['results']
          .map((data) => new Profile.fromJson(data)));
    } else {
      return null;
    }
  }

  void refresh() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    _seed = String.fromCharCodes(Iterable.generate(
        32, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));
  }
}
