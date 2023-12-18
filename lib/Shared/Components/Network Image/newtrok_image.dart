import 'package:flutter/material.dart';

// ClipRRect buildImage({
//   required image,
//   double radius=0,
//   String? fit,
//   Widget? loadingWidget,
// }) {
//   return ClipRRect(
//     borderRadius: BorderRadius.circular(radius),
//     child: CachedNetworkImage(
//       fit: fit == null?  BoxFit.fill:
//       fit == 'cover'? BoxFit.cover: BoxFit.contain,
//       imageUrl: image,
//       placeholder: (context,url) => loadingWidget == null? buildLoadingWidget(size: 40):loadingWidget,
//       errorWidget: (context,url,error) => Icon(Icons.error,color: Colors.red,),
//     ),
//   );
// }