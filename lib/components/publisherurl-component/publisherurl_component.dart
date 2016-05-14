import 'package:angular2/core.dart';

@Component(
    selector: 'publisherurl-component',
templateUrl: 'publisherurl_component.html',
styleUrls: const ['publisherurl_component.css']
)

class PublisherurlComponent {
  @Input() String publisher;
  @Input() String publisher_url;
}