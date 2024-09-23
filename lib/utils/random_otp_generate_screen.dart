import 'dart:math';

String generateOTP({int length = 4}) {
  Random random = Random();
  String otp = '';
  for (int i = 0; i < length; i++) {
    otp += random.nextInt(10).toString(); // 0-9 tak ke digits add karte hain
  }
  return otp;
}

// void fillOTP() {
//   otpController.text = generateOTP();
// }
