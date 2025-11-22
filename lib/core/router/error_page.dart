// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:urbanwear/core/themes/app_theme_manager.dart';
// import 'package:urbanwear/core/widgets/ButtonWidget.dart';
// import 'package:urbanwear/core/widgets/TextWidget.dart';
// import 'package:urbanwear/features/user/Auth/presentation/widgets/NavBarWidget.dart';
// import 'package:urbanwear/features/user/products/presentation/widgets/search_product_faild.dart';
//
// class ErrorPage extends StatelessWidget {
//   const ErrorPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: NavBarWidget(
//         onSearchPressed: () {
//           showModalBottomSheet(
//             context: context,
//             isScrollControlled: true,
//             backgroundColor: Colors.transparent,
//             builder: (context) {
//               return DraggableScrollableSheet(
//                 initialChildSize: 0.9,
//                 minChildSize: 0.2 ,
//                 maxChildSize: 0.9 ,
//                 builder: (_, controller) {
//                   return Container(
//                     color: Colors.black45,
//                     child: SearchProductFaild(),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//       body: Container(
//         width: MediaQuery.sizeOf(context).width ,
//         height: MediaQuery.sizeOf(context).height ,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("Assets/images/pagenotfound.png"),
//             fit: BoxFit.cover
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start ,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextWidget(
//                   text: "404 - Page Not\nFound" ,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 50,
//                   textAlign: TextAlign.start ,
//                 ),
//                 SizedBox(height: 10,),
//                 TextWidget(
//                   text: "Looks Like you're off track." ,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//                 SizedBox(height: 10,),
//                 TextWidget(
//                   text: "The Page you're looking for doesn't exist or has been moved." ,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                 ),
//                 SizedBox(height: 25,),
//                 Row(
//                   children: [
//                     ButtonWidget(
//                       text: "Back to Home",
//                       onPressed: (){
//                         context.go("/home");
//                       },
//                       color: AppThemeManager.secondButtonColor,
//                       fontColor: Colors.black  ,
//                       width: 170,
//                       height: 40,
//                       fontSize: 15,
//                       radius: 3,
//                     ),
//                     SizedBox(width: 15,),
//                     ButtonWidget(
//                       text: "Shop Now",
//                       onPressed: (){
//                         context.go("/shop");
//                       },
//                       color: Colors.transparent ,
//                       fontColor: AppThemeManager.fontColor,
//                       boxBorder: Border.all(
//                         color: AppThemeManager.fontColor
//                       ),
//                       width: 125,
//                       height: 40,
//                       fontSize: 15,
//                       radius: 3,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
