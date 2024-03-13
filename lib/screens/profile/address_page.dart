import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'component/address_widget.dart';
import 'component/container_widget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 290, top: 30),
              child: Text(
                "آدرس ها",
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 14),
              child: BoxWidget(
                iconData: CupertinoIcons.location_solid,
                text: Text(
                  "افزودن آدرس",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 21),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AddressWidget(
              iconData1: CupertinoIcons.location_solid,
              iconData2: Icons.edit,
              text1: Text("م.آزادی،خ.شهید رجایی،خ.تلاش،کوچه هفتم"),
            ),
            Container(
              height: 2,
              width: 300,
              color: Colors.grey.shade300,
            ),
            AddressWidget(
              iconData1: CupertinoIcons.location_solid,
              iconData2: Icons.edit,
              text1: Text("م.آزادی،خ.شهید رجایی،خ.تلاش،کوچه هفتم"),
            ),
            Container(
              height: 2,
              width: 300,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
