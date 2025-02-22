import 'package:abd_shop/constants.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  List<String> _addresses = [];

  void _addAddress() {
    final String address =
        'سایر اطلاعات لازم: ${_cityController.text}, خیابان: ${_streetController.text}, کد پستی: ${_postalCodeController.text}';

    if (address.isNotEmpty) {
      setState(() {
        _addresses.add(address);
      });
      _cityController.clear();
      _streetController.clear();
      _postalCodeController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'وارد کردن آدرس',
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildTextField(_streetController, 'خیابان', Icons.streetview),
            const SizedBox(height: 10),
            _buildTextField(_postalCodeController, 'کد پستی', Icons.pin_drop,
                keyboardType: TextInputType.number),
            const SizedBox(height: 10),
            _buildTextField(
                _cityController, 'سایر اطلاعات لازم', Icons.location_city),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addAddress,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text(
                'تأیید',
                style: TextStyle(color:kWhiteColor,),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _addresses.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        _addresses[index],
                        style: const TextStyle(fontSize: 16),
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

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: kPrimaryColor,),
        prefixIcon: Icon(icon, color: kPrimaryColor,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kPrimaryColor,),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
