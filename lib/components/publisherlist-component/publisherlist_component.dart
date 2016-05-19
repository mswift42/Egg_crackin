import 'package:angular2/core.dart';
import 'package:angularattack2016_mswift42/services/RecipeService.dart';


@Component(
    selector: 'publisherlist-component',
    templateUrl: 'publisherlist_component.html',
styleUrls: const ['publisherlist_component.css']
)

class PublisherlistComponent {
  List<String> publishers;

  PublisherlistComponent(RecipeService _recipeService) {
    publishers = _recipeService.publisherNames();

  }



}