import 'package:angular2/core.dart';

@Injectable()
class SearchhistoryService {
  List<String> _searchhistory;

  void saveSearch(String query) {
    if (!(_searchhistory.contains(query))) {
    _searchhistory.insert(0,query);
      if (_searchhistory.length > 10) {
        _searchhistory.removeLast();
      }
    }
  }

}