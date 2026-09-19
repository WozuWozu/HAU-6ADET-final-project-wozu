import '../models/philosopher.dart';

/// The philosopher pool, bundled as a local asset (proposal: "Bundled local
/// asset", not user-entered data). Starting size is 5, matching the
/// proposal's risk-reduction plan ("Starting amount of philosophers is at
/// 5 to test stability and whether the formatting is effective").
const List<Philosopher> philosopherPool = [
  Philosopher(
    portraitAsset: 'assets/portraits/marcus_aurelius.jpg',
    id: 'marcus_aurelius',
    name: 'Marcus Aurelius',
    era: 'ROMAN · 121–180 AD',
    ideology: 'Stoicism',
    // Once you've dropped an image in assets/portraits/, point to it here:
    // portraitAsset: 'assets/portraits/marcus_aurelius.jpg',
    bio:
        'Marcus Aurelius was Roman Emperor from 161 to 180 AD and is regarded '
        'as one of the most important Stoic philosophers. His private '
        'journal, Meditations, was never intended for publication — it was a '
        'personal set of reminders and reflections written during military '
        'campaigns. He is often called the Philosopher King, a Platonic ideal '
        'made real. Despite ruling an empire during plague and war, he is '
        'remembered most for his inner discipline and humanist governance.',
    philosophy:
        'Stoicism teaches that virtue is the only true good. External events '
        '— health, wealth, reputation — are "preferred indifferents": worth '
        'pursuing, but not worth distress if they are lost. What remains '
        'fully within our control is our judgment, our desires, and our will '
        'to act. Marcus returned constantly to this distinction: focus on '
        'what is yours, release what is not. The practice is a daily, even '
        'hourly discipline.',
    quote:
        'You have power over your mind, not outside events. Realize this, '
        'and you will find strength.',
    quoteSource: 'Meditations, Book VI.',
    books: [
      // Same pattern for book covers, e.g.:
      // Book(title: 'Meditations', author: 'Marcus Aurelius',
      //      coverAsset: 'assets/books/meditations.jpg'),
      Book(title: 'Meditations', author: 'Marcus Aurelius'),
      Book(title: 'The Inner Citadel', author: 'Pierre Hadot'),
      Book(title: 'How to Think Like a Roman Emperor', author: 'Donald Robertson'),
    ],
  ),
  Philosopher(
    id: 'albert_camus',
    name: 'Albert Camus',
    era: 'FRENCH-ALGERIAN · 1913–1960',
    ideology: 'Absurdism',
    bio:
        'Albert Camus was a French-Algerian writer and philosopher, born in '
        '1913 in Mondovi, Algeria, and raised in poverty by a widowed '
        'mother. He worked as a journalist and playwright before becoming '
        'one of the twentieth century\'s most widely read thinkers. He was '
        'awarded the Nobel Prize in Literature in 1957 and died in a car '
        'accident in 1960 at the age of 46.',
    philosophy:
        'Camus\'s philosophy begins from a single observation: humans '
        'search for meaning in a universe that offers none. He called this '
        'collision the Absurd. Rather than resolve it with suicide (giving '
        'up) or a leap of religious faith (pretending it isn\'t there), '
        'Camus argued for a third path: lucid revolt. We keep pushing the '
        'boulder, fully aware it will roll back down, and find our freedom '
        'in the act itself rather than in any final outcome.',
    quote: 'One must imagine Sisyphus happy.',
    quoteSource: 'The Myth of Sisyphus.',
    books: [
      Book(title: 'The Myth of Sisyphus', author: 'Albert Camus'),
      Book(title: 'The Stranger', author: 'Albert Camus'),
      Book(title: 'The Plague', author: 'Albert Camus'),
    ],
  ),
  Philosopher(
    id: 'nietzsche',
    name: 'Friedrich Nietzsche',
    era: 'GERMAN · 1844–1900',
    ideology: 'Perspectivism & Will to Power',
    bio:
        'Friedrich Nietzsche was a German philosopher and philologist, born '
        'in 1844. A professor of classical philology by his mid-twenties, '
        'he left academia due to poor health and spent his most productive '
        'years writing independently. His mental health collapsed in 1889, '
        'and he died in 1900. His writing style — aphoristic, provocative, '
        'and often poetic — makes him one of the most quoted and most '
        'misread philosophers in the Western canon.',
    philosophy:
        'Nietzsche rejected the idea of a single, objective vantage point on '
        'truth, arguing instead that every belief is a perspective shaped by '
        'the believer\'s drives and history. He is equally known for the '
        'will to power: the idea that growth, mastery, and self-overcoming, '
        'not comfort or survival, are the deepest human drive. His figure of '
        'the "Übermensch" describes someone who creates their own values '
        'rather than inheriting them unquestioned.',
    quote: 'That which does not kill us makes us stronger.',
    quoteSource: 'Twilight of the Idols.',
    books: [
      Book(title: 'Thus Spoke Zarathustra', author: 'Friedrich Nietzsche'),
      Book(title: 'Beyond Good and Evil', author: 'Friedrich Nietzsche'),
      Book(title: 'I Am Dynamite!', author: 'Sue Prideaux'),
    ],
  ),
  Philosopher(
    id: 'socrates',
    name: 'Socrates',
    era: 'ANCIENT GREEK · C. 470–399 BC',
    ideology: 'Dialectics & The Socratic Method',
    bio:
        'Socrates left no writings of his own; everything known of him comes '
        'from students like Plato and Xenophon. He spent his life in the '
        'marketplaces of Athens, questioning politicians, poets, and '
        'craftsmen about the nature of virtue, justice, and knowledge. In '
        '399 BC he was tried and sentenced to death for "corrupting the '
        'youth" and "impiety," and accepted the sentence rather than flee '
        'into exile.',
    philosophy:
        'The Socratic method is a form of cooperative argument: rather than '
        'lecture, Socrates asked question after question until a person\'s '
        'stated beliefs revealed their own contradictions. He claimed to '
        'know nothing himself, and treated that admitted ignorance as the '
        'beginning of wisdom rather than a weakness. For Socrates, an '
        'unexamined belief, however comfortable, was not worth holding.',
    quote: 'The unexamined life is not worth living.',
    quoteSource: "Plato's Apology.",
    books: [
      Book(title: 'The Trial and Death of Socrates', author: 'Plato'),
      Book(title: 'The Last Days of Socrates', author: 'Plato'),
      Book(title: 'Socrates: A Man for Our Times', author: 'Paul Johnson'),
    ],
  ),
  Philosopher(
    id: 'kant',
    name: 'Immanuel Kant',
    era: 'PRUSSIAN · 1724–1804',
    ideology: 'Deontology',
    bio:
        'Immanuel Kant spent nearly his entire life in Königsberg, Prussia, '
        'reportedly never travelling more than ten miles from the city. A '
        'famously disciplined routine — townspeople were said to set their '
        'clocks by his afternoon walk — gave him decades to develop a '
        'philosophy that reshaped how the West thinks about knowledge, '
        'ethics, and duty. He published his major works relatively late in '
        'life, after years of quiet, methodical work.',
    philosophy:
        'Kant argued that the morality of an action lies in the intention '
        'behind it, not its consequences. His central test, the categorical '
        'imperative, asks whether the rule behind your action could be '
        'willed as a universal law for everyone. Lying, for Kant, is wrong '
        'not because it sometimes backfires, but because a world where '
        'everyone lied whenever convenient would make lying — and trust — '
        'impossible in the first place.',
    quote: 'Act only according to that maxim whereby you can at the same '
        'time will that it should become a universal law.',
    quoteSource: 'Groundwork of the Metaphysics of Morals.',
    books: [
      Book(title: 'Groundwork of the Metaphysics of Morals', author: 'Immanuel Kant'),
      Book(title: 'Critique of Pure Reason', author: 'Immanuel Kant'),
      Book(title: 'Kant: A Very Short Introduction', author: 'Roger Scruton'),
    ],
  ),
];
