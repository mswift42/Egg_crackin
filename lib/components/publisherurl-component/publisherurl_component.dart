import 'package:angular2/core.dart';

@Component(
    selector: 'publisherurl-component',
    templateUrl: 'publisherurl_component.html')
class PublisherurlComponent {
  @Input()
  String publisher;
  @Input()
  String publisher_url;
}
