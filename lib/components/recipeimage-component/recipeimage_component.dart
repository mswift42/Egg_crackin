import 'package:angular2/core.dart';

@Component(
    selector: 'recipeimage-component',
templateUrl: 'recipeimage_component.html',
styleUrls: const ['recipeimage_component.css']
)

class RecipeimageComponent {
  @Input() String imageurl;
  @Input() String alttext;
}