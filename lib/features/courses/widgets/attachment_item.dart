
import 'package:edumate/core/consts/const_container_decorations.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:flutter/material.dart';

class AttachmentItem extends StatelessWidget {
  const AttachmentItem({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: height * 0.2,
      width: width * 0.4,
      decoration: Theme.of( context).brightness == Brightness.light?
          ConstContainerDecorations.whiteshadow(context) :
          ConstContainerDecorations.darkmodeshadow(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.file_present, color: Colors.blue, size: 30,),
          ),
          Text(
            'Assignment_Details.pdf',
    
            style: Theme.of(context).brightness == Brightness.light?
                Fonts.normalblackstyle14 : Fonts.normalwhitestyle14,
          ),
    
          Text('PDF • 4.5 MB',style: Fonts.normalgreystyle16,),
          
          ElevatedButton(onPressed: (){}, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.download, color: Colors.grey,),
            Text('Download', style: Fonts.normalgreystyle16,),
          ],))
        ],
      ),
    );
  }
}
