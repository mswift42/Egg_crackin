import 'package:angular2/core.dart';
import 'package:eggcrackin/services/SearchhistoryService.dart';

@Component(
    selector: 'search-history',
    templateUrl: 'search-history.component.html',
    styleUrls: const ['search-history.component.css'])
class SearchHistoryComponent {
  List<dynamic> searchhistory;

  SearchHistoryComponent(SearchhistoryService _searchhistoryService) {
    _searchhistoryService.loadFromStorage();
    searchhistory = _searchhistoryService.searchHistory;
  }
}
