import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection('products');
  addItem() async {
    CollectionReference documentReference =
        _firestore.doc('piano').collection('piano-products');

    Map<String, dynamic> data = <String, dynamic>{
      'descraption': 'descraption',
      'image': 'image',
      'price': '1',
      'rate': '2',
      'title': 'title'
    };
    await documentReference
        .add(data)
        .whenComplete(() => print('$data'))
        .catchError((e) => print(e));
  }

    readItems() {
    CollectionReference notesItemCollection =
        _firestore.doc('piano').collection('piano-products');

    print(notesItemCollection.get().toString()) ;
    // notesItemCollection.snapshots();
  }
}
