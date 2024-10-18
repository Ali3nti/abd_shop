import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final TextEditingController _addressController = TextEditingController();
  late Box<String> _addressBox;

  @override
  void initState() {
    super.initState();
    _addressBox = Hive.box<String>('addresses'); // دسترسی به جعبه آدرس‌ها
  }

  void _addAddress() {
    String newAddress = _addressController.text;

    if (newAddress.isNotEmpty) {
      setState(() {
        _addressBox.add(newAddress); // اضافه کردن آدرس جدید به جعبه
        _addressController.clear(); // پاک کردن فیلد ورودی
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('لطفاً آدرس را وارد کنید')),
      );
    }
  }

  void _removeAddress(int index) {
    setState(() {
      _addressBox.deleteAt(index); // حذف آدرس از جعبه
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("مدیریت آدرس‌ها"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: "آدرس جدید",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addAddress,
              child: const Text("اضافه کردن آدرس"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ValueListenableBuilder<Box<String>>(
                valueListenable: _addressBox.listenable(),
                builder: (context, box, _) {
                  final addresses = box.values.toList(); // دریافت آدرس‌ها
                  return ListView.builder(
                    itemCount: addresses.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(addresses[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () => _removeAddress(index), // حذف آدرس
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
