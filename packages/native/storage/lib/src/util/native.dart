import 'dart:ffi';

DynamicLibrary? tryOpenDylib(String name) {
  try {
    return DynamicLibrary.open(name);
  } on Object {
    return null;
  }
}
