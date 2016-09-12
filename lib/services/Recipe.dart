class Recipe {
  String publisher, title, source_url, image_url, publisher_url;

  Recipe(this.publisher, this.title, this.source_url, this.image_url,
      this.publisher_url);

  Recipe.fromJsonMap(Map recipemap) {
    publisher = recipemap["publisher"];
    title = _unsanitize(recipemap["title"]);
    source_url = recipemap["source_url"].toString();
    image_url = recipemap["image_url"];
    publisher_url = recipemap["publisher_url"];
  }

  String _unsanitize(String s) {
    s = s.replaceAll("&nbsp;", " ");
    s = s.replaceAll("&#8217;", "'");
    return s.replaceAll("&amp;", "&");
  }
}
