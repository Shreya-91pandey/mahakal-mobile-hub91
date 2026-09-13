import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class WhatsAppHelper {
  static Future<void> openChat({String? message}) async {
    final text = Uri.encodeComponent(message ?? 'Hello Mahakal Mobile Hub!');
    final url = Uri.parse(
        'https://wa.me/${AppStrings.whatsappNumber}?text=$text');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> inquireProduct(Product product) async {
    final msg = '''
Namaste! 🙏

I am interested in this product:

📱 *${product.name}*
💰 Price: ₹${product.price.toStringAsFixed(0)}
🏷️ Brand: ${product.brand}
📦 Category: ${product.category}

Please share availability & final price.
''';
    await openChat(message: msg);
  }

  static Future<void> placeOrder({
    required List<CartItem> items,
    required String customerName,
    required String customerPhone,
    required String pinCode,
    required String address,
    String? note,
  }) async {
    final buffer = StringBuffer();
    buffer.writeln('🛒 *New Order - Mahakal Mobile Hub*');
    buffer.writeln('');
    buffer.writeln('👤 Name: $customerName');
    buffer.writeln('📞 Phone: $customerPhone');
    buffer.writeln('📍 Pincode: $pinCode');
    buffer.writeln('🏠 Address: $address');
    buffer.writeln('');
    buffer.writeln('--- Order Items ---');

    double total = 0;
    for (var item in items) {
      buffer.writeln(
          '• ${item.product.name} x${item.quantity} = ₹${item.total.toStringAsFixed(0)}');
      total += item.total;
    }

    buffer.writeln('');
    buffer.writeln('💰 *Total: ₹${total.toStringAsFixed(0)}*');

    final isIndore = DeliveryRules.isIndore(pinCode);
    if (isIndore) {
      buffer.writeln('🚚 Delivery: 2-Hour Fast Delivery (Indore)');
      buffer.writeln('💵 Payment: COD Available');
    } else {
      buffer.writeln('🚚 Delivery: All India Shipping');
      buffer.writeln('💳 Payment: Prepaid only (No COD)');
    }

    if (note != null && note.isNotEmpty) {
      buffer.writeln('');
      buffer.writeln('📝 Note: $note');
    }

    buffer.writeln('');
    buffer.writeln('Please confirm this order. Thank you!');

    await openChat(message: buffer.toString());
  }

  static Future<void> askCustomRequest({
    required String name,
    required String phone,
    required String request,
  }) async {
    final msg = '''
🔔 *Custom Request - Mahakal Mobile Hub*

👤 Name: $name
📞 Phone: $phone

📝 Requirement:
$request

Please contact me regarding this.
''';
    await openChat(message: msg);
  }
}
