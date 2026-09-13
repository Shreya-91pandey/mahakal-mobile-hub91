import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../services/product_service.dart';
import '../models/product.dart';
import '../utils/constants.dart';

class AddEditProductScreen extends StatefulWidget {
  final Product? product; // null = add new

  const AddEditProductScreen({super.key, this.product});

  @override
  State<AddEditProductScreen> createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _brandController;
  late TextEditingController _priceController;
  late TextEditingController _originalPriceController;
  late TextEditingController _imageUrlController;
  late TextEditingController _descriptionController;
  late TextEditingController _stockController;
  late TextEditingController _offerTextController;
  late TextEditingController _warrantyController;

  String _category = 'smartphone';
  bool _isFeatured = false;
  bool _isOffer = false;

  bool get isEditing => widget.product != null;

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    _nameController = TextEditingController(text: p?.name ?? '');
    _brandController = TextEditingController(text: p?.brand ?? '');
    _priceController =
        TextEditingController(text: p?.price.toStringAsFixed(0) ?? '');
    _originalPriceController = TextEditingController(
        text: p?.originalPrice?.toStringAsFixed(0) ?? '');
    _imageUrlController = TextEditingController(text: p?.imageUrl ?? '');
    _descriptionController =
        TextEditingController(text: p?.description ?? '');
    _stockController =
        TextEditingController(text: p?.stock.toString() ?? '10');
    _offerTextController = TextEditingController(text: p?.offerText ?? '');
    _warrantyController =
        TextEditingController(text: p?.warranty ?? '1 Year Brand Warranty');
    if (p != null) {
      _category = p.category;
      _isFeatured = p.isFeatured;
      _isOffer = p.isOffer;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _priceController.dispose();
    _originalPriceController.dispose();
    _imageUrlController.dispose();
    _descriptionController.dispose();
    _stockController.dispose();
    _offerTextController.dispose();
    _warrantyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Product' : 'Add Product'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0.5,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildField(_nameController, 'Product Name *', Icons.smartphone),
            _buildField(_brandController, 'Brand *', Icons.business),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _category,
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.category),
              ),
              items: const [
                DropdownMenuItem(value: 'smartphone', child: Text('New Smartphone')),
                DropdownMenuItem(value: 'refurbished', child: Text('Refurbished')),
                DropdownMenuItem(value: 'accessory', child: Text('Accessory')),
                DropdownMenuItem(value: 'repair', child: Text('Repair Service')),
              ],
              onChanged: (v) => setState(() => _category = v!),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _buildField(
                    _priceController,
                    'Selling Price *',
                    Icons.currency_rupee,
                    keyboard: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildField(
                    _originalPriceController,
                    'Original Price',
                    Icons.money_off,
                    keyboard: TextInputType.number,
                  ),
                ),
              ],
            ),
            _buildField(
              _stockController,
              'Stock Quantity *',
              Icons.inventory,
              keyboard: TextInputType.number,
            ),
            _buildField(_imageUrlController, 'Image URL *', Icons.image),
            _buildField(_descriptionController, 'Description *', Icons.description,
                maxLines: 3),
            _buildField(_warrantyController, 'Warranty', Icons.verified),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text('Featured Product'),
              value: _isFeatured,
              activeColor: AppColors.primary,
              onChanged: (v) => setState(() => _isFeatured = v),
            ),
            SwitchListTile(
              title: const Text('Show as Offer'),
              value: _isOffer,
              activeColor: AppColors.primary,
              onChanged: (v) => setState(() => _isOffer = v),
            ),
            if (_isOffer)
              _buildField(_offerTextController, 'Offer Badge Text', Icons.local_offer),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isEditing ? 'Update Product' : 'Add Product',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType keyboard = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboard,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
          alignLabelWithHint: maxLines > 1,
        ),
        validator: (v) {
          if (label.contains('*') && (v == null || v.isEmpty)) {
            return 'Required';
          }
          return null;
        },
      ),
    );
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final productService =
        Provider.of<ProductService>(context, listen: false);

    final product = Product(
      id: widget.product?.id ?? const Uuid().v4(),
      name: _nameController.text.trim(),
      brand: _brandController.text.trim(),
      category: _category,
      price: double.tryParse(_priceController.text) ?? 0,
      originalPrice: _originalPriceController.text.isNotEmpty
          ? double.tryParse(_originalPriceController.text)
          : null,
      imageUrl: _imageUrlController.text.trim(),
      description: _descriptionController.text.trim(),
      stock: int.tryParse(_stockController.text) ?? 0,
      isFeatured: _isFeatured,
      isOffer: _isOffer,
      offerText: _isOffer ? _offerTextController.text.trim() : null,
      warranty: _warrantyController.text.trim(),
    );

    if (isEditing) {
      productService.updateProduct(product);
    } else {
      productService.addProduct(product);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isEditing ? 'Product updated' : 'Product added'),
        backgroundColor: AppColors.success,
      ),
    );
    Navigator.pop(context);
  }
}
