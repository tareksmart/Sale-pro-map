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

    Stream<List<T>> collectionStream<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String documentId)
          builder,//وظيفته يرول على ماب او بيانات داخل دوكيمنت
      Query Function(Query query)? queryBuilder,
      int Function(T lhs, T rhs)? sort}) {
    Query query = _fireStoreInstance.collection(path); //اعمل query للكل all collections
    if (queryBuilder != null) {
      //لو ال querybuilder اللى جاى من بره ملبان يعنى عايزين نستعلم عن شىء معين
      query = queryBuilder(
          query); //خد query for all collection مرره بالqueryBuilder والنتيجة حطها فى ال object query من نوع َQuery
    }
    final snapshots = query.snapshots();
    return snapshots.map(
      (snapshot /*one collection*/) {
        final result = snapshot.docs
            .map(
              (snapshot /*one document*/) {
                return builder(
                  snapshot.data() as Map<String, dynamic>,
                  snapshot.id,
                );
              },
            )
            .where((value) => value != null)
            .toList();
        if (sort != null) {
          result.sort(sort);
        }
        return result;
      },
    );
  }
  }

