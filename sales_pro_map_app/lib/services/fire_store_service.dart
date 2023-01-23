import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  FireStoreServices._();
  static final instance = FireStoreServices._();
  final _fireStoreInstance = FirebaseFirestore.instance;

  Stream<T> documentStream<T>(
      {required path,
      required T Function(Map<String, dynamic>? data, String documentId)
          builder}) {
    final docReferance = _fireStoreInstance.doc(path);
    final snapshots = docReferance.snapshots();
    return snapshots.map((event) => builder(event.data(), event.id));
  }

  Stream<List<T>> collectionStream<T>({required path,required T Function (Map<String,dynamic>?data,String documentId)builder,
  Query Function (Query query)?queryBuilder,int Function(T lhs, T rhs)? sort})
  {
    Query query=_fireStoreInstance.collection(path);
    if(queryBuilder!=null){
      query=queryBuilder(query);
          }
          final snapshots=query.snapshots();
          return snapshots.map((event) {
            final result=event.docs.map((e) {
              return builder(e.data() as Map<String,dynamic>,e.id,);
            }).where((value)=>value!=null).tolist();
           if (sort != null) {
          result.sort(sort);
        }
         },
         );
  }
  
}
