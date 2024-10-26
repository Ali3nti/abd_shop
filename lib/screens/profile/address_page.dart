import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final TextEditingController _addressController = TextEditingController();
  final List<String> _addresses = [];

  void _addAddress() {
    String newAddress = _addressController.text;

    if (newAddress.isNotEmpty) {
      setState(() {
        _addresses.add(newAddress); // اضافه کردن آدرس جدید به لیست
        _addressController.clear(); // پاک کردن فیلد ورودی
      });
    } else {
      // نمایش پیام خطا
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('لطفاً آدرس را وارد کنید')),
      );
    }
  }

  void _removeAddress(int index) {
    setState(() {
      _addresses.removeAt(index); // حذف آدرس از لیست
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
              child: ListView.builder(
                itemCount: _addresses.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(_addresses[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => _removeAddress(index), // حذف آدرس
                      ),
                    ),
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




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'component/box_widget.dart';
//
// class AddressPage extends StatefulWidget {
//   const AddressPage({super.key});
//
//   @override
//   State<AddressPage> createState() => _AddressPageState();
// }
//
// class _AddressPageState extends State<AddressPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("آدرس ها"),
//         backgroundColor: Colors.deepOrange,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             BoxWidget(onPressed: (){},
//               iconData: CupertinoIcons.location_solid,
//               text: const Text(
//                 "افزودن آدرس",
//                 style: TextStyle(color: Colors.deepOrange, fontSize: 21),
//               ),
//             ),
//             const SizedBox(height: 20),
//             _buildAddressCard("م.آزادی، خ.شهید رجایی، خ.تلاش، کوچه هفتم"),
//             const SizedBox(height: 10),
//             _buildAddressCard("م.آزادی، خ.شهید رجایی، خ.تلاش، کوچه هشتم"),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAddressCard(String address) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ListTile(
//         leading: const Icon(CupertinoIcons.location_solid, color: Colors.deepOrange),
//         title: Text(address),
//         trailing: IconButton(
//           icon: const Icon(Icons.edit, color: Colors.blue),
//           onPressed: () {
//             // منطق ویرایش آدرس
//           },
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'component/box_widget.dart';
// //
// // class AddressPage extends StatefulWidget {
// //   const AddressPage({super.key});
// //
// //   @override
// //   State<AddressPage> createState() => _AddressPageState();
// // }
// //
// // class _AddressPageState extends State<AddressPage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             const Padding(
// //               padding: EdgeInsets.only(left: 290, top: 30),
// //               child: Text(
// //                 "آدرس ها",
// //                 style: TextStyle(fontSize: 30),
// //               ),
// //             ),
// //             const SizedBox(
// //               height: 20,
// //             ),
// //             const Padding(
// //               padding: EdgeInsets.only(left: 14),
// //               child: BoxWidget(
// //                 iconData: CupertinoIcons.location_solid,
// //                 text: Text(
// //                   "افزودن آدرس",
// //                   style: TextStyle(color: Colors.deepOrange, fontSize: 21),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20,
// //             ),
// //             AddressWidget(
// //               iconData1: CupertinoIcons.location_solid,
// //               iconData2: Icons.edit,
// //               text1: Text("م.آزادی،خ.شهید رجایی،خ.تلاش،کوچه هفتم"),
// //             ),
// //             Container(
// //               height: 2,
// //               width: 300,
// //               color: Colors.grey.shade300,
// //             ),
// //             AddressWidget(
// //               iconData1: CupertinoIcons.location_solid,
// //               iconData2: Icons.edit,
// //               text1: Text("م.آزادی،خ.شهید رجایی،خ.تلاش،کوچه هفتم"),
// //             ),
// //             Container(
// //               height: 2,
// //               width: 300,
// //               color: Colors.grey.shade300,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
