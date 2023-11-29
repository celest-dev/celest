@first()
@second()
library;

import 'package:celest/celest.dart';

@third()
@fourth()
Future<String> sayHello(FunctionContext context, String name) async {
  return 'Hello, $name!';
}

class first implements Middleware {
  const first();

  @override
  Handler handle(Handler handler) {
    print('first');
    return handler;
  }
}

class second implements Middleware {
  const second();

  @override
  Handler handle(Handler handler) {
    print('second');
    return handler;
  }
}

class third implements Middleware {
  const third();

  @override
  Handler handle(Handler handler) {
    print('third');
    return handler;
  }
}

class fourth implements Middleware {
  const fourth();

  @override
  Handler handle(Handler handler) {
    print('fourth');
    return handler;
  }
}
