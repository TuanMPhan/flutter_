import 'package:cloud_firestore/cloud_firestore.dart';

void setADocument() {
  final db = FirebaseFirestore.instance;
  final city = <String, String>{
    "name": "Los Angeles",
    "state": "CA",
    "country": "USA"
  };

  db
      .collection("cities")
      .doc("LA")
      .set(city)
      .onError((e, _) => print("Error writing document: $e"));
}

void setADocument2() {
  // Update one field, creating the document if it does not already exist.
  final db = FirebaseFirestore.instance;
  final data = {"capital": true};

  // if not sure that the document exists, pass the option to merge the new data with any exsiting document to avoid overwriting the entire document
  db.collection("cities").doc("BJ").set(data, SetOptions(merge: true));
}

void dataTypes() {
  final db = FirebaseFirestore.instance;

  final docData = {
    "stringExample": "Hello world!",
    "booleanExample": true,
    "numberExample": 3.14159265,
    "dateExample": Timestamp.now(),
    "listExample": [1, 2, 3],
    "nullExample": null
  };

  final nestedData = {
    "a": 5,
    "b": true,
  };

  docData["objectExample"] = nestedData;

  db
      .collection("data")
      .doc("one")
      .set(docData)
      .onError((e, _) => print("Error writing document: $e"));
}

class City {
  final String? name;
  final String? state;
  final String? country;
  final bool? capital;
  final int? population;
  final List<String>? regions;

  City({
    this.name,
    this.state,
    this.country,
    this.capital,
    this.population,
    this.regions,
  });

  factory City.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return City(
      name: data?['name'],
      state: data?['state'],
      country: data?['country'],
      capital: data?['capital'],
      population: data?['population'],
      regions:
          data?['regions'] is Iterable ? List.from(data?['regions']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (state != null) "state": state,
      if (country != null) "country": country,
      if (capital != null) "capital": capital,
      if (population != null) "population": population,
      if (regions != null) "regions": regions,
    };
  }
}

void customObjects() async {
  final db = FirebaseFirestore.instance;
  final city = City(
    name: "Los Angeles",
    state: "CA",
    country: "USA",
    capital: false,
    population: 5000000,
    regions: ["west_coast", "socal"],
  );
  final docRef = db
      .collection("cities")
      .withConverter(
        fromFirestore: City.fromFirestore,
        toFirestore: (City city, options) => city.toFirestore(),
      )
      .doc("LA");
  await docRef.set(city);
}

void addADocument() {
  // add a new document with custom id
  final db = FirebaseFirestore.instance;
  db.collection("cities").doc("new-city-id").set({"name": "Chicago"});
}

void addADocument2() {
  final db = FirebaseFirestore.instance;
  // Add a new document with a generated id.
  final data = {"name": "Tokyo", "country": "Japan"};

  db.collection("cities").add(data).then((documentSnapshot) =>
      print("Added Data with ID: ${documentSnapshot.id}"));
}

void updateADocument() {
  final db = FirebaseFirestore.instance;
  final washingtonRef = db.collection("cities").doc("DC");
  washingtonRef.update({"capital": true}).then(
      (value) => print("DocumentSnapshot successfully updated!"),
      onError: (e) => print("Error updating document $e"));
}

void serverTimestamp() {
  final db = FirebaseFirestore.instance;
  final docRef = db.collection("objects").doc("some-id");
  final updates = <String, dynamic>{
    "timestamp": FieldValue.serverTimestamp(),
  };

  docRef.update(updates).then(
      (value) => print("DocumentSnapshot successfully updated!"),
      onError: (e) => print("Error updating document $e"));
}

void updateNested() {
  final db = FirebaseFirestore.instance;
  db
      .collection('users')
      .doc('frank')
      .update({'age': 13, 'favorites.color': 'Red'});
}

void updateElementsInArray() {
  final db = FirebaseFirestore.instance;
  final washingtonRef = db.collection("cities").doc("DC");

  // Atomically add a new region to the "regions" array field.
  washingtonRef.update({
    "regions": FieldValue.arrayUnion(["greater_virginia"]),
  });

  // Atomically remove a region from the "regions" array field.
  washingtonRef.update({
    "regions": FieldValue.arrayRemove(["east_coast"]),
  });
}

void incrementANumericValue() {
  final db = FirebaseFirestore.instance;
  var washingtonRef = db.collection('cities').doc('DC');

  // Atomically increment the population of the city by 50.
  washingtonRef.update(
    {"population": FieldValue.increment(50)},
  );
}

void updatingDataWithTransactions() {
  final db = FirebaseFirestore.instance;
  final sfDocRef = db.collection("cities").doc("SF");
  db.runTransaction((transaction) async {
    final snapshot = await transaction.get(sfDocRef);

    final newPopulation = snapshot.get("population") + 1;
    transaction.update(sfDocRef, {"population": newPopulation});
  }).then(
    (value) => print("DocumentSnapshot successfully updated!"),
    onError: (e) => print("Error updating document $e"),
  );
}

void batchedWrites() {
  final db = FirebaseFirestore.instance;
  // Get a new write batch
  final batch = db.batch();

  // Set the value of 'NYC'
  var nycRef = db.collection("cities").doc("NYC");
  batch.set(nycRef, {"name": "New York City"});

  // Update the population of 'SF'
  var sfRef = db.collection("cities").doc("SF");
  batch.update(sfRef, {"population": 1000000});

  // Delete the city 'LA'
  var laRef = db.collection("cities").doc("LA");
  batch.delete(laRef);

  // Commit the batch
  batch.commit().then((_) => print('Batched write succesfully'),
      onError: (e) => print('Error batch writing $e'));
}

void deleteDocs() {
  final db = FirebaseFirestore.instance;
  db.collection("cities").doc("DC").delete().then(
        (doc) => print("Document deleted"),
        onError: (e) => print("Error updating document $e"),
      );
}

void deleteFields() {
  final db = FirebaseFirestore.instance;
  final docRef = db.collection("cities").doc("BJ");

  // Remove the 'capital' field from the document
  final updates = <String, dynamic>{
    "capital": FieldValue.delete(),
  };

  docRef.update(updates);
}

void getADocument() {
  final db = FirebaseFirestore.instance;
  final docRef = db.collection("cities").doc("SF");
  docRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print(data);
    },
    onError: (e) => print("Error getting document: $e"),
  );
}

void sourceOptions() {
  final db = FirebaseFirestore.instance;
  final docRef = db.collection("cities").doc("SF");

  // Source can be CACHE, SERVER, or DEFAULT.
  const source = Source.cache;

  docRef.get(const GetOptions(source: source)).then(
        (res) => print("Successfully completed"),
        onError: (e) => print("Error completing: $e"),
      );
}

void getCustomObjects() async {
  final db = FirebaseFirestore.instance;
  final ref = db.collection("cities").doc("LA").withConverter(
        fromFirestore: City.fromFirestore,
        toFirestore: (City city, _) => city.toFirestore(),
      );
  final docSnap = await ref.get();
  final city = docSnap.data(); // Convert to City object
  if (city != null) {
    print(city);
  } else {
    print("No such document.");
  }
}

void multipleDocumentsFromACollection() {
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
}

void getAllDocumentsInACollection() {
  final db = FirebaseFirestore.instance;
  db.collection("cities").get().then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}

void getAllDocumentsInASubcollection() {
  final db = FirebaseFirestore.instance;
  db.collection("cities").doc("SF").collection("landmarks").get().then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}

