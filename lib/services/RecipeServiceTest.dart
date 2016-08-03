import 'package:test/test.dart';
import 'package:eggcrackin/services/RecipeService.dart';


void main() {
  var recservice = new RecipeService();
  test('apikey is a string', () {
   expect(recservice.food2forkapikey is String, true);
  });
  test('expect querySearch to return a string' , () {
   expect(recservice.queryUrl("hallo") is String, true);
  });
  test('expect querySearch to return correct query string', () {
   var q1 = recservice.queryUrl("bacon");
    expect(q1, "http://food2fork.com/api/search?key=7987c43afcf8a03a964bbcb0c9152c84&q=bacon");
    var q2 = recservice.queryUrl("french toast");
    expect(q2,"http://food2fork.com/api/search?key=7987c43afcf8a03a964bbcb0c9152c84&q=french&toast");
    var q3 = recservice.queryUrl("french toast bacon");
    expect(q3, "http://food2fork.com/api/search?key=7987c43afcf8a03a964bbcb0c9152c84&q=french&toast&bacon");
  });
}