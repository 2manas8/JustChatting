import 'package:frontend/repositories/personal_details.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Jwt {
  static void decodeToken(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    PersonalDetails.id = decodedToken['id'];
    PersonalDetails.name = decodedToken['name'];
    PersonalDetails.username = decodedToken['username'];
    PersonalDetails.email = decodedToken['email'];
    PersonalDetails.phone = decodedToken['phone'];
  }
}