import 'package:angular2/core.dart';
import 'dart:html';
import 'dart:convert';

@Injectable()
class SearchhistoryService {
  List<String> _searchhistory = [];
  Storage localStorage = window.localStorage;
  final _storagename = "searchhistory";

  void saveSearch(String query) {
    if (!(_searchhistory.contains(query))) {
      _searchhistory.insert(0, query);
      saveToStorage();
      if (_searchhistory.length > 10) {
        _searchhistory.removeLast();
        saveToStorage();
      }
    }
  }

  get searchHistory => _searchhistory;

  bool notEmpty() {
    return _searchhistory.length > 0;
  }

  String firstEntry() {
    return _searchhistory[0];
  }

  void saveToStorage() {
    localStorage[_storagename] = JSON.encode(_searchhistory);
  }

  void loadFromStorage() {
    if (localStorage[_storagename] != null) {
      _searchhistory = JSON.decode(localStorage[_storagename]);
    }
  }
}
