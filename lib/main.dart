import 'package:flutter/material.dart';

// شاشة المتجر الرئيسية
class ShadowStoreHomeScreen extends StatelessWidget {
  const ShadowStoreHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHADOW STORE'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. الأزرار الرئيسية (شراء، بيع، المهام)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // إجراء الشراء العام
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('شراء'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // إجراء البيع
                  },
                  icon: const Icon(Icons.sell),
                  label: const Text('بيع'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // مهام التطبيق
                  },
                  icon: const Icon(Icons.task_alt),
                  label: const Text('المهام'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            const Text(
              'قائمة الحسابات المتاحة',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // 2. الحساب البرونزي (0.30 باي)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'الحساب البرونزي',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'السعر: 0.30 باي (Pi)',
                      style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        // كود شراء الحساب البرونزي
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('جاري معالجة شراء الحساب البرونزي...')),
                        );
                      },
                      child: const Text('شراء الحساب البرونزي'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 3. الحساب الفضي (1 دولار)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'الحساب الفضي',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'السعر: 1 دولار',
                      style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        // رابط الدفع للحساب الفضي (يمكنك وضع رابط موقع الدفع هنا)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم الانتقال لرابط الدفع للحساب الفضي ($1)')),
                        );
                      },
                      child: const Text('الدفع 1 دولار (رابط الدفع)'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 4. الحساب الذهبي (3 دولار)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'الحساب الذهبي',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'السعر: 3 دولار',
                      style: TextStyle(fontSize: 16, color: Colors.amber, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade800),
                      onPressed: () {
                        // رابط الدفع للحساب الذهبي
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم الانتقال لرابط الدفع للحساب الذهبي ($3)')),
                        );
                      },
                      child: const Text('الدفع 3 دولار (رابط الدفع)'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
