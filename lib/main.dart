import 'dart0000:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ShadowStoreApp());
}

// -----------------------------------------------------------------------------
// الألوان والثيم الخاص بتطبيق SHADOW STORE
// -----------------------------------------------------------------------------
class AppTheme {
  static const Color background = Color(0xFF0D1117);
  static const Color surface = Color(0xFF161B22);
  static const Color surfaceAlt = Color(0xFF21262D);
  static const Color border = Color(0xFF30363D);
  static const Color primary = Color(0xFF1F16FEB);
  static const Color primaryLight = Color(0xFF58A6FF);
  static const Color success = Color(0xFF2EA043);
  static const Color danger = Color(0xFFCF222E);
  static const Color warning = Color(0xFFD29922);
  static const Color textPrimary = Color(0xFFF0F6FC);
  static const Color textMuted = Color(0xFF8B949E);

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          primary: primary,
          secondary: primaryLight,
          surface: surface,
          error: danger,
          onPrimary: Colors.white,
          onSurface: textPrimary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: background,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      );
}

// -----------------------------------------------------------------------------
// التطبيق الرئيسي
// -----------------------------------------------------------------------------
class ShadowStoreApp extends StatelessWidget {
  const ShadowStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SHADOW STORE',
      theme: AppTheme.dark,
      home: const HomeScreen(),
    );
  }
}

// -----------------------------------------------------------------------------
// نموذج بيانات المنتجات والحسابات
// -----------------------------------------------------------------------------
class StoreItem {
  final String id;
  final String title;
  final String category;
  final double price;
  final String description;
  final bool isVerified;

  StoreItem({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.description,
    this.isVerified = true,
  });
}

// قائمة الحسابات المتاحة للبيع
final List<StoreItem> storeProducts = [
  StoreItem(
    id: '1',
    title: 'حساب جوجل أمريكي (Google Play US)',
    category: 'حسابات جوجل',
    price: 5.00,
    description: 'حساب مفعل بالكامل، جاهز للشحن واستلام نقاط Play Points.',
    isVerified: true,
  ),
  StoreItem(
    id: '2',
    title: 'حساب Google Play أمريكي مشحون',
    category: 'حسابات ألعاب',
    price: 12.50,
    description: 'حساب يحتوي على رصيد جاهز للشراء المباشر داخل الألعاب.',
    isVerified: true,
  ),
  StoreItem(
    id: '3',
    title: 'بطاقة هدايا / شفرة تفعيل',
    category: 'بطاقات رقمية',
    price: 10.00,
    description: 'كود جاهز للتفعيل الفوري على أي حساب أمريكي.',
    isVerified: false,
  ),
];

// -----------------------------------------------------------------------------
// الشاشة الرئيسية لمتجر SHADOW STORE
// -----------------------------------------------------------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHADOW STORE'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: AppTheme.primaryLight),
            onPressed: () {
              // زر إضافة منتج أو حساب للبيع
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('صفحة إضافة حساب جديد للبيع')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // بنر ترحيبي لمتجر SHADOW STORE
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.surfaceAlt, AppTheme.surface],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.primaryLight.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.shield_moon_sharp, size: 48, color: AppTheme.primaryLight),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'منصة SHADOW STORE',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'بيع وشراء حسابات جوجل والخدمات الرقمية بأمان',
                        style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // قائمة الحسابات والمنتجات المعروضة
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: storeProducts.length,
              itemBuilder: (context, index) {
                final item = storeProducts[index];
                return Card(
                  color: AppTheme.surface,
                  margin: const EdgeInsets.only(bottom: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(color: AppTheme.border),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // التصنيف وحالة التوثيق
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppTheme.surfaceAlt,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                item.category,
                                style: const TextStyle(fontSize: 12, color: AppTheme.primaryLight),
                              ),
                            ),
                            if (item.isVerified)
                              Row(
                                children: const [
                                  Icon(Icons.verified, size: 16, color: AppTheme.success),
                                  SizedBox(width: 4),
                                  Text(
                                    'مضمون',
                                    style: TextStyle(fontSize: 12, color: AppTheme.success),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // العنوان
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 6),

                        // الوصف
                        Text(
                          item.description,
                          style: const TextStyle(fontSize: 13, color: AppTheme.textMuted),
                        ),
                        const SizedBox(height: 16),

                        // السعر وزر الشراء
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${item.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.success,
                              ),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primary,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                // إجراء تنفيذ عملية الشراء
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('جاري الشراء: ${item.title}')),
                                );
                              },
                              icon: const Icon(Icons.shopping_cart_checkout, size: 18, color: Colors.white),
                              label: const Text('شراء الآن', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

