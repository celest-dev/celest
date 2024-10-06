import 'package:celest/celest.dart';

const myName = env('MY_NAME');
const myAge = env('MY_AGE');
const myHeight = env('MY_HEIGHT');

// Non-const variables should be allowed.
// ignore: prefer_const_declarations
final myWeight = const env('IM_COOL');

// Non-const initializers should be allowed.
// ignore: prefer_const_constructors
final myWebsite = env('MY_WEBSITE');
