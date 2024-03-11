import 'package:http/browser_client.dart' as http;
import 'package:http/http.dart' as http;

http.Client createHttpClient() {
  return http.BrowserClient()..withCredentials = true;
}
