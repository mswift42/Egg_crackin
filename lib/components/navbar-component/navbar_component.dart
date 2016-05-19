import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angularattack2016_mswift42/components/recipe-component/recipe_component.dart';
import 'package:angularattack2016_mswift42/components/favourite-component/favourite_component.dart';

@Component(
    selector: 'navbar-component',
    templateUrl: 'navbar_component.html',
    styleUrls: const ['navbar_component.css'],
    directives: const [ROUTER_DIRECTIVES])
@RouteConfig(const [
  const Route(
      path: '/',
      name: 'Recipes',
      component: RecipeComponent,
      useAsDefault: true),
  const Route(
      path: '/favourites', name: 'Favourites', component: FavouriteComponent)
])
class NavbarComponent {}
