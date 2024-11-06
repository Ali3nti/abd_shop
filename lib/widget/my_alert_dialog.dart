// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:ftm_service_app/constants.dart';
// import 'package:ftm_service_app/global.dart';
// import 'package:ftm_service_app/screens/home/home_page.dart';
// import 'package:ftm_service_app/services/translations.dart';
// import 'package:ftm_service_app/services/update_data.dart';
// import 'package:hive/hive.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// class ExitAlertDialog extends StatelessWidget {
//   const ExitAlertDialog({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: Text(
//         getTranslated(context, 'close_app_mess'),
//       ),
//       actions: <Widget>[
//         TextButton(
//           child: Text(
//             getTranslated(context, 'yes'),
//           ),
//           onPressed: () {
//             Hive.close();
//             SystemNavigator.pop();
//           },
//         ),
//         TextButton(
//           child: Text(
//             getTranslated(context, 'no'),
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ],
//     );
//   }
// }

// class UpdateAlertDialog extends StatelessWidget {
//   const UpdateAlertDialog({super.key, required this.isRequired});
//   final bool isRequired;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('بروزرسانی'),
//       content: SizedBox(
//         height: 100,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             (isRequired)
//                 ? const Text(
//                     'برای ورود به اپلیکیشن ابتدا باید به نسخه جدید بروزرسانی کنید!')
//                 : const Text('نسخه جدید اپلیکیشن هم اکنون در دسترس است!'),
//             Text('نسخه جدید: $newVersion'),
//             Text(
//               'نسخه فعلی: $appVersion',
//               style: const TextStyle(color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           style: TextButton.styleFrom(
//               foregroundColor: kWhiteColor, backgroundColor: kGreenColor),
//           child: const Text('بروزرسانی'),
//           onPressed: () async {
//             if (await canLaunchUrlString('${authURL}update')) {
//               await launchUrlString('${authURL}update?role=${user.role.id}',
//                   mode: LaunchMode.externalApplication);
//             } else {
//               if (kDebugMode) {
//                 print("URL can't be launched.");
//               }
//             }
//           },
//         ),
//         (!isRequired)
//             ? TextButton(
//                 style: TextButton.styleFrom(
//                     foregroundColor: kRedColor, backgroundColor: null),
//                 child: const Text(
//                   'فعلا نه!',
//                 ),
//                 onPressed: () {
//                   if (isRequiredUpdate) {
//                     SystemNavigator.pop();
//                   } else {
//                     Navigator.pop(context);
//                   }
//                 },
//               )
//             : const SizedBox(),
//       ],
//     );
//   }
// }

// class NewFuturesAlertDialog extends StatelessWidget {
//   NewFuturesAlertDialog({super.key, required this.data});
//   final List<dynamic> data;
//   final List<Widget> _contents = [];
//   setContents() {
//     String itemVersion = "";
//     for (var item in data) {
//       if (item["version"] != itemVersion) {
//         itemVersion = item["version"].toString();
//         _contents.add(
//           Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 3),
//                   Text(
//                     'نسخه $itemVersion:',
//                     style: TextStyle(
//                         fontSize: 14, color: kPrimaryColor.withAlpha(200)),
//                   ),
//                   const SizedBox(height: 3)
//                 ],
//               ),
//             ],
//           ),
//         );
//       }
//       _contents.add(
//         Row(
//           children: [
//             const Icon(
//               Icons.circle,
//               size: 6,
//             ),
//             const SizedBox(width: 3),
//             Expanded(
//                 child: Text(
//               item["description"].toString(),
//               style: const TextStyle(fontSize: 11),
//             )),
//           ],
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     setContents();
//     return AlertDialog(
//       title: const Text('تغییرات اخیر'),
//       content: SingleChildScrollView(
//         child: Column(
//           children: _contents,
//         ),
//       ),
//       actions: [
//         TextButton(
//           style: TextButton.styleFrom(
//               foregroundColor: kRedColor, backgroundColor: null),
//           child: const Text(
//             'بستن',
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ],
//     );
//   }
// }

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: SizedBox(
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitCircle(
              size: 50.0,
              color: Colors.indigo,
            ),
            Text(
              'لطفا منتظر بمانید',
            )
          ],
        ),
      ),
    );
  }
}

// class FinalAlertDialog extends StatefulWidget {
//   const FinalAlertDialog({super.key, this.message});
//
//   final String? message;
//
//   @override
//   State<FinalAlertDialog> createState() => _FinalAlertDialogState();
// }
//
// class _FinalAlertDialogState extends State<FinalAlertDialog> {
//   bool isClicked = false;
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       alignment: Alignment.center,
//       content: SizedBox(
//         height: 200,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.check_circle,
//               color: kGreenColor,
//               size: 80,
//             ),
//             const SizedBox(height: 3),
//             Text(
//               getTranslated(context, 'god_bless_you'),
//               style: const TextStyle(
//                 fontSize: 26,
//               ),
//             ),
//             const SizedBox(height: 3),
//             if (widget.message != null)
//               Text(
//                 widget.message ?? '',
//                 style: const TextStyle(
//                   fontSize: 14,
//                 ),
//               ),
//           ],
//         ),
//       ),
//       actionsOverflowAlignment: OverflowBarAlignment.center,
//       actions: [
//         TextButton(
//           style: TextButton.styleFrom(
//               backgroundColor: kGreenColor, foregroundColor: kWhiteColor),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text(
//                 getTranslated(context, 'login_main_page'),
//               ),
//               if (isClicked)
//                 const SpinKitCircle(
//                   color: kWhiteColor,
//                   size: 20,
//                 ),
//             ],
//           ),
//           onPressed: () async {
//             isClicked = true;
//             setState(() {});
//             // Provider.of<UpdateUserStatus>(context, listen: false)
//             //     .changeUserStatus((user.role.id)StatusFlag.outOfShift);
//             if (user.role.id == 3 || user.role.id == 4 || isDemoMode) {
//               await br.updateShiftData(context);
//             } else {
//               await br.updateEmployeeStatus(context);
//             }
//             /////////////////////////////
//             if (!mounted) return;
//             ////////////////////////////
//             Navigator.pushAndRemoveUntil(
//                 context,
//                 PageTransition(
//                   child: const HomePage(),
//                   type: PageTransitionType.leftToRight,
//                 ),
//                 (route) => false);
//           },
//         ),
//         TextButton(
//           child: Text(
//             getTranslated(context, 'exit_app'),
//             style: const TextStyle(color: kRedColor),
//           ),
//           onPressed: () {
//             SystemNavigator.pop();
//           },
//         ),
//       ],
//     );
//   }
// }

// class SelectableListDialog extends StatefulWidget {
//   const SelectableListDialog({
//     super.key,
//     required this.title,
//     required this.baseList,
//     required this.controller,
//     required this.onChanged,
//     this.selectedItem,
//   });
//   final String title;
//   final List<dynamic> baseList;
//   final TextEditingController controller;
//   final dynamic selectedItem;
//   final Function(dynamic) onChanged;
//
//   @override
//   State<SelectableListDialog> createState() => _SelectableListDialogState();
// }
//
// class _SelectableListDialogState extends State<SelectableListDialog> {
//   late List tempList;
//   late dynamic selectedItem;
//   @override
//   void initState() {
//     super.initState();
//     tempList = widget.baseList;
//     selectedItem = widget.selectedItem;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       elevation: 2,
//       scrollable: false,
//       contentPadding: EdgeInsets.zero,
//       title: Column(
//         children: [
//           Text(
//             widget.title,
//           ),
//           Container(
//             decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(0.0))),
//             margin: const EdgeInsets.only(top: 5, bottom: 15),
//             padding: const EdgeInsets.only(),
//             child: TextFormField(
//               controller: widget.controller,
//               decoration: const InputDecoration(
//                 hintText: "جست و جو",
//                 contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
//               ),
//               onChanged: (val) {
//                 tempList.clear();
//                 if (val.isNotEmpty && val.length > 2) {
//                   tempList.addAll(
//                       widget.baseList.where((e) => e.name!.contains(val)));
//                 } else {
//                   tempList.addAll(widget.baseList);
//                 }
//                 setState(() {});
//               },
//             ),
//           ),
//         ],
//       ),
//       content: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: tempList.isNotEmpty
//             ? ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: tempList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return RadioListTile<dynamic>(
//                       title: Text(
//                         '${tempList[index].name}',
//                       ),
//                       value: tempList[index],
//                       groupValue: widget.selectedItem,
//                       onChanged: (value) {
//                         widget.onChanged(value);
//                         selectedItem = value;
//                         // widget.baseController?.text = value.name;
//                         // print(widget.baseController?.text);
//                         setState(() {});
//                       });
//                 })
//             : const Center(
//                 child: Text(
//                   "نتیجه ای یافت نشد",
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//       ),
//       actions: [
//         ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               setState(() {});
//             },
//             child: const Text("بستن"))
//       ],
//     );
//   }
// }
