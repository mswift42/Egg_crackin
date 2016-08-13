import 'package:angular2/core.dart' show Output, Component, EventEmitter;

@Component(
    selector: 'recipe-search',
    templateUrl: 'recipe-search.component.html',
    styleUrls: const ['recipe-search.component.css'])
class RecipeSearchComponent {
  @Output()
  EventEmitter<String> onSearch = new EventEmitter<String>();

  recipesSearch(String query) {
    onSearch.emit(query);
  }
}
