import 'package:angular2/core.dart';

@Injectable()
class SearchhistoryService {
  Set<String> _searchhistory;

  void saveSearch(String query) {
    _searchhistory.add(query);
  }
}