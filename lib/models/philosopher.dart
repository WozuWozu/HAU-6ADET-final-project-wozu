/// A recommended book, shown in the horizontal BookTile list
/// on the Philosopher Card (design system: BookTile component).
class Book {
  final String title;
  final String author;
  /// Optional path to a cover image, e.g. 'assets/books/meditations.jpg'.
  /// If null, BookTile falls back to a colored placeholder with the title.
  final String? coverAsset;

  const Book({required this.title, required this.author, this.coverAsset});
}

/// One entry in the philosopher pool.
///
/// Matches "Data the app remembers" in the proposal:
/// id, name, ideology, bio, bookRecommendations, plus the era/quote
/// fields the mockup actually shows on the Philosopher Card.
class Philosopher {
  final String id;
  final String name;
  final String era; // e.g. "ROMAN · 121–180 AD"
  final String ideology; // tag chip, e.g. "Stoicism"
  final String bio;
  final String philosophy; // "Philosophy & Ideology" accordion body
  final String quote;
  final String quoteSource; // e.g. "Meditations, Book VI."
  final List<Book> books;
  /// Optional path to a portrait image, e.g. 'assets/portraits/marcus.jpg'.
  /// Used on the Philosopher Card header and, smaller, on PhilosopherRow.
  /// If null, both widgets fall back to a monogram placeholder.
  final String? portraitAsset;

  const Philosopher({
    required this.id,
    required this.name,
    required this.era,
    required this.ideology,
    required this.bio,
    required this.philosophy,
    required this.quote,
    required this.quoteSource,
    required this.books,
    this.portraitAsset,
  });
}
