import 'package:flutter/material.dart';

void main() {
  runApp(const ShadowStoreApp());
}

class ShadowStoreApp extends StatelessWidget {
  const ShadowStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SHADOW STORE',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1F16FEB),
          surface: Color(0xFF161B22),
        ),
      ),
      home: const ShadowStoreHomeScreen(),
    );
  }
}

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
            // الأزرار الرئيسية (شراء، بيع، المهام)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('شراء'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.sell),
                  label: const Text('بيع'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
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

            // الحساب البرونزي (0.30 باي)
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('الحساب البرونزي', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('السعر: 0.30 باي (Pi)', style: TextStyle(fontSize: 16, color: Colors.green)),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
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

            // الحساب الفضي (1 دولار)
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('الحساب الفضي', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('السعر: 1 دولار', style: TextStyle(fontSize: 16, color: Colors.blue)),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(r'تم الانتقال لرابط الدفع للحساب الفضي ($1)')),
                        );
                      },
                      child: const Text(r'الدفع $1 (رابط الدفع)'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // الحساب الذهبي (3 دولار)
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('الحساب الذهبي', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('السعر: 3 دولار', style: TextStyle(fontSize: 16, color: Colors.amber)),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(r'تم الانتقال لرابط الدفع للحساب الذهبي ($3)')),
                        );
                      },
                      child: const Text(r'الدفع $3 (رابط الدفع)'),
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
