import 'dart:html';

import 'package:angular2/core.dart';
import 'package:eggcrackin/services/Recipe.dart';
import 'package:eggcrackin/services/RecipeService.dart';
import 'package:eggcrackin/services/SearchhistoryService.dart';
import 'package:eggcrackin/components/recipeimage-component/recipeimage_component.dart';
import 'package:eggcrackin/components/title-component/title_component.dart';
import 'package:eggcrackin/components/publisherurl-component/publisherurl_component.dart';
import 'package:eggcrackin/components/bookmark-component/bookmark_component.dart';
import 'package:eggcrackin/components/recipe-search/recipe-search.component.dart';
import 'package:eggcrackin/components/recipesview-component/recipesview.component.dart';
import 'package:eggcrackin/components/toast-component/toast.component.dart';
import 'package:eggcrackin/services/ToastService.dart';

@Component(
    selector: 'recipe-component',
    templateUrl: 'recipe_component.html',
    styleUrls: const [
      'recipe_component.css'
    ],
    directives: const [
      RecipeimageComponent,
      TitleComponent,
      PublisherurlComponent,
      BookmarkComponent,
      RecipeSearchComponent,
      RecipesViewComponent,
      ToastComponent
    ])
class RecipeComponent implements OnInit {
  final RecipeService _recservice;
  final SearchhistoryService _searchhistoryservice;
  final ToastService _toastService;
  List<Recipe> recipes;
  ElementRef elementRef;
  bool noResults = false;

  RecipeComponent(this._recservice, this._searchhistoryservice,
      this._toastService, this.elementRef);

  @override
  void ngOnInit() {
    if (_searchhistoryservice.notEmpty()) {
      _recservice.loadData(
          _searchhistoryservice.firstEntry(), _recservice.currentpage);
      recipes = _recservice.recipes;
    }
    elementRef.nativeElement.onScroll
        .listen((event) => print("it's scrolling"));
  }

  void searchRecipes(String value) {
    noResults = false;
    _recservice.recipes = [];
    _recservice.loadData(value);
    recipes = _recservice.recipes;
    _searchhistoryservice.saveSearch(value);
    checkIfResults();
  }

  void showToast(bool status) {
    _toastService.toggleShow();
  }

  void checkIfResults() {
    if (recipes.length == 0) {
      noResults = true;
    }
  }

  bool toggleToast() {
    return _toastService.show;
  }

  void showNextPage() {
    _recservice.incCurrentPage();
    _recservice.recipes = [];
    _recservice.loadData(_searchhistoryservice.firstEntry());
    recipes = _recservice.recipes;
  }
}
