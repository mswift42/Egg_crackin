import 'package:angularattack2016_mswift42/services/Recipe.dart';
import 'package:angular2/core.dart';

@Injectable()
class RecipeService {
  final String _food2forkapikey = '7987c43afcf8a03a964bbcb0c9152c84';

  String get food2forkapikey => _food2forkapikey;

  String queryUrl(String query) {
    var split = query.trim().split(" ");
    var key = food2forkapikey;
    var res = "http://food2fork.com/api/search?key=$key&q=";
    res += split[0];
    for (var s in split.sublist(1)) {
      res += "&$s";
    }
    return res;
  }
}

