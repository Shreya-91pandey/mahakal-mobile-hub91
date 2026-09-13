import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFE53935); // Deep red - Mahakal theme
  static const Color primaryDark = Color(0xFFB71C1C);
  static const Color accent = Color(0xFFFF6F00);
  static const Color background = Color(0xFFF5F5F5);
  static const Color card = Colors.white;
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color success = Color(0xFF2E7D32);
  static const Color offer = Color(0xFFD32F2F);
  static const Color star = Color(0xFFFFC107);
}

class AppStrings {
  static const String appName = 'Mahakal Mobile Hub';
  static const String tagline = 'Your Trusted Mobile Partner in Indore';
  static const String whatsappNumber = '919876543210'; // CHANGE THIS
  static const String adminPassword = 'mahakal@123'; // CHANGE THIS
}

class DeliveryRules {
  /// Indore pin codes (sample - expand as needed)
  static const List<String> indorePinCodes = [
    '452001', '452002', '452003', '452004', '452005',
    '452006', '452007', '452008', '452009', '452010',
    '452011', '452012', '452013', '452014', '452015',
    '452016', '452018', '452020',
  ];

  static bool isIndore(String pinCode) {
    return indorePinCodes.contains(pinCode.trim());
  }

  static String getDeliveryMessage(String pinCode) {
    if (isIndore(pinCode)) {
      return 'âœ… Indore: 2-Hour Fast Delivery + Cash on Delivery available';
    }
    return 'ðŸ“¦ All India Shipping available â€¢ COD not available (Prepaid only)';
  }
}
