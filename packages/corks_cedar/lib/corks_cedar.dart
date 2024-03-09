/// Corks are authorization tokens which are based off Google's
/// [Macaroons](https://research.google/pubs/macaroons-cookies-with-contextual-caveats-for-decentralized-authorization-in-the-cloud/)
/// paper. They are bearer tokens which identify the entity possessing them,
/// while providing a mechanism for embedding further restrictions via
/// [Cedar](https://www.cedarpolicy.com/en) policy caveats.
library;

export 'src/cork.dart';
export 'src/signer.dart';
