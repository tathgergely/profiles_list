import 'package:profiles_list/models/profile.dart';
import 'package:profiles_list/repositories/api_handler.dart';

class HomeViewModel {
  ApiHandler handler = ApiHandler();
  late int pageNumber, numberOfItemsPerPage, results;

  HomeViewModel() {
    pageNumber = 1;
    numberOfItemsPerPage = 50;
    results = 1000;
  }

  bool isLowerPageNumberEnabled() => (pageNumber > 1);

  bool isUpperPageNumberEnabled() =>
      (pageNumber < (results / numberOfItemsPerPage).ceil());

  void lowerPageNumber() {
    pageNumber--;
  }

  void upperPageNumber() {
    pageNumber++;
  }

  Future<List<Profile>> getProfiles() async {
    List<Profile>? profiles = await handler.fetch(pageNumber,numberOfItemsPerPage);
    if (profiles == null) {
      throw Exception("Something happened");
    }

    return profiles;
  }

  void refresh() {
    pageNumber=1;
    numberOfItemsPerPage = 50;
    handler.refresh();
  }
}
