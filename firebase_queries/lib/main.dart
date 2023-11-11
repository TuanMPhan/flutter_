// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_queries/firebase_options.dart';
import 'package:firebase_queries/queries.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

  //* Add data
  //? Adding documents
  //! setADocument();
  //
  //! setADocument2();
  //
  //? Firestore allows for a variety of data types inside a document (strings, booleans, numbers, dates, null, nested arrays and objects). numbers are always stored as double
  //! dataTypes();
  //
  //? firestore allows for custom objects/classes
  //! customObjects();
  //
  //! addADocument();
  //? add a new document
  //! addADocument2();

  //? Update a document
  //! updateADocument();

  //? server timestamp
  //! serverTimestamp();

  //? update nested fields
  //! updateNested();

  //? update elements in an array
  //! updateElementsInArray();

  //? increment a numeric value
  //! incrementANumericValue();

  //? Transaction
  //! updatingDataWithTransactions();

  //? Batch write
  //! batchedWrites();

  //? Delete data
  //! deleteDocs();
  //! deleteFields();

  //* Read Data
  //? Get a document
  //! getADocument();

  //? Getting data from platform with offline support (CACHED DATA)
  //! sourceOptions();

  //? reading custom objects
  //! getCustomObjects();

  //? reading multiple documents from a collection
  //! multipleDocumentsFromACollection();

  //? reading all documents in a collection
  //! getAllDocumentsInACollection();

  //? reading  all documents in a subcollection
  //! getAllDocumentsInASubcollection();

  //* Simple queries

  final db = FirebaseFirestore.instance;
  db.collection("cities").where("capital", isEqualTo: true).get().then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );

  //? (!=) comparision operator return documents where the given field exist and does not match the comparision value

  db.collection("cities").where("capital", isNotEqualTo: true).get().then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );

  //?  Array-contains
  db
      .collection("cities")
      .where("regions", arrayContains: 'west_coast')
      .get()
      .then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );

  //? in, not-in, array-contains-any. (in) can combine upto 30 (==) clauses. on the same field with the logical OR
  db
      .collection("cities")
      .where("country", whereIn: ['USA', 'Japan'])
      .get()
      .then(
        (querySnapshot) {
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs) {
            print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        },
        onError: (e) => print("Error completing: $e"),
      );

  //? not-in can combine upto 10 (!=) clauses. on the same field with the logical AND
  db
      .collection("cities")
      .where("country", whereNotIn: ['USA', 'Japan'])
      .get()
      .then(
        (querySnapshot) {
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs) {
            print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        },
        onError: (e) => print("Error completing: $e"),
      );

  //? array-contains-any can combine upto 30 arrays-contains clauses. on the same field with the logical OR (duplication are removed from the results)
  db
      .collection("cities")
      .where("regions", arrayContainsAny: ['west_coast', 'east_coast'])
      .get()
      .then(
        (querySnapshot) {
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs) {
            print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        },
        onError: (e) => print("Error completing: $e"),
      );

  ///? limitations:
  ///? Firestore provides support for logical OR through (or, in, array-contains-any). limited to 30 disjunctions
  ///? can use at most one array-contains clause per disjunction (or group). cant combine array-contains and array-contains-any in the same disjunction
  ///? cannot combine not-in with !=

  // * Compound (AND) queries
  db
      .collection("cities")
      .where("state", isEqualTo: "CA")
      .where("population", isGreaterThan: 1000000)
      .get()
      .then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );

  //* OR queries
  db
      .collection("cities")
      .where(Filter.or(Filter("capital", isEqualTo: true),
          Filter("population", isGreaterThan: 1000000)))
      .get()
      .then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );

  // * Combination of OR and AND operations

  db
      .collection("cities")
      .where(Filter.and(
          Filter("state", isEqualTo: "CA"),
          Filter.or(Filter("capital", isEqualTo: true),
              Filter("population", isGreaterThan: 1000000))))
      .get()
      .then(
    (querySnapshot) {
      print("Successfully completed 0");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );

  //* Collection group query
  db.collectionGroup("landmarks").where("type", isEqualTo: "museum").get().then(
    (querySnapshot) {
      print("Successfully completed ");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );

  //* OrderBy and existence. When you order a query by a given field, the query can return only the documents where the order-by field exists
  //? limitations:
  //? The result set will not include documents that do not contain the given fields
  //? If you include a filter with a range comparison (<, <=, >, >=), your first ordering must be on the same field
  db
      .collection("cities")
      .where("population", isGreaterThan: 100000)
      .orderBy("population")
      .limit(2)
      .get()
      .then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );

  //? Count() aggregation
  db.collection("cities").count().get().then(
        (res) => print('Number of cities is ${res.count}'),
        onError: (e) => print("Error completing: $e"),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: Brightness.dark,
            surface: const Color(0xff003909)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
