import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sermanos/features/postulate/data/datasources/remote/volunteering_remote_data_source.dart';
import 'package:sermanos/features/postulate/data/entities/volunteering_entity.dart';
import 'package:sermanos/features/postulate/data/entities/volunteering_reduced_entity.dart';
import 'package:sermanos/features/postulate/domain/models/postulation_status.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering_reduced.dart';
import 'package:sermanos/features/user/data/entities/app_user_entity.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';

void main() {
  test(
    'Volunteering Entity to Model',
    () {
      DateTime creationTime = DateTime.now();
      VolunteeringEntity expectedVolunteeringEntity = VolunteeringEntity(
        id: "1",
        name: "Voluntariado 1",
        category: "Categoría 1",
        description: "Descripción 1",
        about: "Acerca de 1",
        address: "Dirección 1",
        requirements: ["Requerimiento 1"],
        availability: ["Disponibilidad 1"],
        lat: 1.0,
        lng: 1.0,
        imageUrl: "https://unsplash.com/photos/qQWxYWVKSsc",
        capacity: 1,
        volunteersQty: 1,
        creationTime: creationTime,
      );

      Volunteering expectedVolunteeringModel = Volunteering(
        id: "1",
        name: "Voluntariado 1",
        category: "Categoría 1",
        description: "Descripción 1",
        about: "Acerca de 1",
        address: "Dirección 1",
        requirements: const ["Requerimiento 1"],
        availability: const ["Disponibilidad 1"],
        lat: 1.0,
        lng: 1.0,
        imageUrl: "https://unsplash.com/photos/qQWxYWVKSsc",
        capacity: 1,
        volunteersQty: 1,
        creationTime: creationTime,
      );

      expect(
        expectedVolunteeringEntity.toModel(),
        expectedVolunteeringModel,
      );
    },
  );

  test("Get volunteerings from firestore", () async {
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

    final volunteeringRemoteDataSource = VolunteeringRemoteDataSourceImpl(
      firebaseDatabaseClient: fakeFirebaseFirestore,
    );

    final mockDocumentReference = fakeFirebaseFirestore
        .collection(VolunteeringEntity.collectionName)
        .doc("1");

    DateTime creationTime = DateTime.now();

    final Map<String, dynamic> mockVolunteeringMap = {
      "name": "Voluntariado 1",
      "category": "Categoría 1",
      "description": "Descripción 1",
      "about": "Acerca de 1",
      "address": "Dirección 1",
      "requirements": ["Requerimiento 1"],
      "availability": ["Disponibilidad 1"],
      "lat": 1.0,
      "lng": 1.0,
      "imageUrl": "https://unsplash.com/photos/qQWxYWVKSsc",
      "capacity": 1,
      "volunteersQty": 1,
      "creationTime": creationTime,
    };

    await mockDocumentReference.set(mockVolunteeringMap);

    final actualVolunteeringEntityList =
        await volunteeringRemoteDataSource.getVolunteerings(searchTerm: null);

    final actualVolunteeringModelList =
        actualVolunteeringEntityList.map((e) => e.toModel()).toList();

    final expectedVolunteeringModelList = [
      Volunteering(
        id: "1",
        name: "Voluntariado 1",
        category: "Categoría 1",
        description: "Descripción 1",
        about: "Acerca de 1",
        address: "Dirección 1",
        requirements: const ["Requerimiento 1"],
        availability: const ["Disponibilidad 1"],
        lat: 1.0,
        lng: 1.0,
        imageUrl: "https://unsplash.com/photos/qQWxYWVKSsc",
        capacity: 1,
        volunteersQty: 1,
        creationTime: creationTime,
      )
    ];

    expect(actualVolunteeringModelList, expectedVolunteeringModelList);
  });

  test("Get volunteering by id from firestore", () async {
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

    final volunteeringRemoteDataSource = VolunteeringRemoteDataSourceImpl(
      firebaseDatabaseClient: fakeFirebaseFirestore,
    );

    final mockDocumentReference = fakeFirebaseFirestore
        .collection(VolunteeringEntity.collectionName)
        .doc("1");

    DateTime creationTime = DateTime.now();

    final Map<String, dynamic> mockVolunteeringMap = {
      "name": "Voluntariado 1",
      "category": "Categoría 1",
      "description": "Descripción 1",
      "about": "Acerca de 1",
      "address": "Dirección 1",
      "requirements": ["Requerimiento 1"],
      "availability": ["Disponibilidad 1"],
      "lat": 1.0,
      "lng": 1.0,
      "imageUrl": "https://unsplash.com/photos/qQWxYWVKSsc",
      "capacity": 1,
      "volunteersQty": 1,
      "creationTime": creationTime,
    };

    await mockDocumentReference.set(mockVolunteeringMap);

    final actualVolunteeringEntityOption = await volunteeringRemoteDataSource
        .getVolunteeringById(volunteeringId: "1");

    final actualVolunteeringModel = actualVolunteeringEntityOption.fold(
      () => null,
      (volunteeringEntity) => volunteeringEntity.toModel(),
    );

    if (actualVolunteeringModel == null) {
      fail("Volunteering model is null");
    }

    final expectedVolunteeringModel = Volunteering(
      id: "1",
      name: "Voluntariado 1",
      category: "Categoría 1",
      description: "Descripción 1",
      about: "Acerca de 1",
      address: "Dirección 1",
      requirements: ["Requerimiento 1"],
      availability: ["Disponibilidad 1"],
      lat: 1.0,
      lng: 1.0,
      imageUrl: "https://unsplash.com/photos/qQWxYWVKSsc",
      capacity: 1,
      volunteersQty: 1,
      creationTime: creationTime,
    );

    expect(actualVolunteeringModel, expectedVolunteeringModel);
  });

  test("Get user volunteering from firestore", () async {
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

    final volunteeringRemoteDataSource = VolunteeringRemoteDataSourceImpl(
      firebaseDatabaseClient: fakeFirebaseFirestore,
    );

    final mockDocumentReference = fakeFirebaseFirestore
        .collection(AppUserEntity.collectionName)
        .doc("1")
        .collection(VolunteeringReducedEntity.collectionName)
        .doc("1");

    DateTime creationTime = DateTime.now();

    final Map<String, dynamic> mockVolunteeringMap = {
      "name": "Voluntariado 1",
      "category": "Categoría 1",
      "description": "Descripción 1",
      "about": "Acerca de 1",
      "address": "Dirección 1",
      "requirements": ["Requerimiento 1"],
      "availability": ["Disponibilidad 1"],
      "lat": 1.0,
      "lng": 1.0,
      "imageUrl": "https://unsplash.com/photos/qQWxYWVKSsc",
      "capacity": 1,
      "volunteersQty": 1,
      "creationTime": creationTime,
    };

    await mockDocumentReference.set(mockVolunteeringMap);

    final actualVolunteeringReducedEntityOption =
        await volunteeringRemoteDataSource.getUserVolunteering(userId: "1");

    final actualVolunteeringReducedModel =
        actualVolunteeringReducedEntityOption.fold(
      () => null,
      (volunteeringReducedEntity) => volunteeringReducedEntity.toModel(),
    );

    if (actualVolunteeringReducedModel == null) {
      fail("Volunteering reduced model is null");
    }

    const expectedVolunteeringReducedModel = VolunteeringReduced(
      id: "1",
      name: "Voluntariado 1",
      category: "Categoría 1",
      lat: 1.0,
      lng: 1.0,
      status: PostulationStatus.unknown,
    );

    expect(actualVolunteeringReducedModel, expectedVolunteeringReducedModel);
  });

  test("Postulate user to volunteering from firestore", () async {
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

    final volunteeringRemoteDataSource = VolunteeringRemoteDataSourceImpl(
      firebaseDatabaseClient: fakeFirebaseFirestore,
    );

    var mockDocumentReference = fakeFirebaseFirestore
        .collection(VolunteeringEntity.collectionName)
        .doc("1");

    DateTime creationTime = DateTime.now();

    final Map<String, dynamic> mockVolunteeringMap = {
      "name": "Voluntariado 1",
      "category": "Categoría 1",
      "description": "Descripción 1",
      "about": "Acerca de 1",
      "address": "Dirección 1",
      "requirements": ["Requerimiento 1"],
      "availability": ["Disponibilidad 1"],
      "lat": 1.0,
      "lng": 1.0,
      "imageUrl": "https://unsplash.com/photos/qQWxYWVKSsc",
      "capacity": 10,
      "volunteersQty": 0,
      "creationTime": creationTime,
    };

    await mockDocumentReference.set(mockVolunteeringMap);

    final mockCollectionReference = fakeFirebaseFirestore
        .collection(VolunteeringEntity.collectionName)
        .doc("1")
        .collection("postulations");

    const AppUser mockAppUser = AppUser(
      id: "1",
      name: "Name 1",
      surname: "Surname 1",
      email: "test@yopmail.com",
    );

    await volunteeringRemoteDataSource.postulateUserToVolunteering(
        user: mockAppUser, volunteeringId: "1");

    final collectionCount = await mockCollectionReference.count().get();

    expect(collectionCount.count, 1);
  });

  test("Cancel user volunteering postulation from firestore", () async {
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

    final volunteeringRemoteDataSource = VolunteeringRemoteDataSourceImpl(
      firebaseDatabaseClient: fakeFirebaseFirestore,
    );

    var mockDocumentReference = fakeFirebaseFirestore
        .collection(VolunteeringEntity.collectionName)
        .doc("1");

    DateTime creationTime = DateTime.now();

    final Map<String, dynamic> mockVolunteeringMap = {
      "name": "Voluntariado 1",
      "category": "Categoría 1",
      "description": "Descripción 1",
      "about": "Acerca de 1",
      "address": "Dirección 1",
      "requirements": ["Requerimiento 1"],
      "availability": ["Disponibilidad 1"],
      "lat": 1.0,
      "lng": 1.0,
      "imageUrl": "https://unsplash.com/photos/qQWxYWVKSsc",
      "capacity": 10,
      "volunteersQty": 0,
      "creationTime": creationTime,
    };

    await mockDocumentReference.set(mockVolunteeringMap);

    mockDocumentReference = fakeFirebaseFirestore
        .collection(VolunteeringEntity.collectionName)
        .doc("1")
        .collection("postulations")
        .doc("1");

    await mockDocumentReference.set({"name": "Name 1", "surname": "Surname 1"});

    const AppUser mockAppUser = AppUser(
      id: "1",
      name: "Name 1",
      surname: "Surname 1",
      email: "test@yopmail.com",
    );

    await volunteeringRemoteDataSource.cancelUserVolunteeringPostulation(
        user: mockAppUser, volunteeringId: "1");

    final mockCollectionReference = fakeFirebaseFirestore
        .collection(VolunteeringEntity.collectionName)
        .doc("1")
        .collection("postulations");

    final collectionCount = await mockCollectionReference.count().get();

    expect(collectionCount.count, 0);
  });

  group("Cancel user volunteering from firestore", () {
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

    final volunteeringRemoteDataSource = VolunteeringRemoteDataSourceImpl(
      firebaseDatabaseClient: fakeFirebaseFirestore,
    );
    DateTime creationTime = DateTime.now();

    final Map<String, dynamic> mockVolunteeringMap = {
      "name": "Voluntariado 1",
      "category": "Categoría 1",
      "description": "Descripción 1",
      "about": "Acerca de 1",
      "address": "Dirección 1",
      "requirements": ["Requerimiento 1"],
      "availability": ["Disponibilidad 1"],
      "lat": 1.0,
      "lng": 1.0,
      "imageUrl": "https://unsplash.com/photos/qQWxYWVKSsc",
      "capacity": 10,
      "volunteersQty": 0,
      "creationTime": creationTime,
    };

    const AppUser mockAppUser = AppUser(
      id: "1",
      name: "Name 1",
      surname: "Surname 1",
      email: "test@yopmail.com",
    );

    test("Remove volunteering from user ", () async {
      var mockDocumentReference = fakeFirebaseFirestore
          .collection(VolunteeringEntity.collectionName)
          .doc("1");

      await mockDocumentReference.set(mockVolunteeringMap);

      await volunteeringRemoteDataSource.cancelUserVolunteering(
          user: mockAppUser, volunteeringId: "1");

      final userPostulationQuery = fakeFirebaseFirestore
          .collection(AppUserEntity.collectionName)
          .doc("1")
          .collection(VolunteeringEntity.collectionName)
          .doc("1");

      final response = await userPostulationQuery.get();

      expect(response.exists, false);
    });

    test("Reduce volunteers qty from volunteering", () async {
      var mockDocumentReference = fakeFirebaseFirestore
          .collection(VolunteeringEntity.collectionName)
          .doc("1");

      await mockDocumentReference.set(mockVolunteeringMap);

      final volunteeringQtyQuery = fakeFirebaseFirestore
          .collection(VolunteeringEntity.collectionName)
          .doc("1");

      await volunteeringQtyQuery.update({
        'volunteersQty': 1,
      });

      await volunteeringRemoteDataSource.cancelUserVolunteering(
          user: mockAppUser, volunteeringId: "1");

      mockDocumentReference = fakeFirebaseFirestore
          .collection(VolunteeringEntity.collectionName)
          .doc("1");

      final response = await mockDocumentReference.get();

      expect(response.data()!['volunteersQty'], 0);
    });

    test("Remove from members from volunteering", () async {
      var mockDocumentReference = fakeFirebaseFirestore
          .collection(VolunteeringEntity.collectionName)
          .doc("1");

      await mockDocumentReference.set(mockVolunteeringMap);

      await volunteeringRemoteDataSource.cancelUserVolunteering(
          user: mockAppUser, volunteeringId: "1");

      final volunteeringMembersQuery = fakeFirebaseFirestore
          .collection(VolunteeringEntity.collectionName)
          .doc("1")
          .collection("members")
          .doc("1");

      final response = await volunteeringMembersQuery.get();

      expect(response.exists, false);
    });
  });

  test("Add favorite volunteering to firestore", () async {
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

    final volunteeringRemoteDataSource = VolunteeringRemoteDataSourceImpl(
      firebaseDatabaseClient: fakeFirebaseFirestore,
    );

    await volunteeringRemoteDataSource.addFavoriteVolunteering(
        userId: "1", volunteeringId: "1");

    final mockCollectionReference = fakeFirebaseFirestore
        .collection(AppUserEntity.collectionName)
        .doc("1")
        .collection("favoriteVolunteerings");

    final collectionCount = await mockCollectionReference.count().get();

    expect(collectionCount.count, 1);
  });

  test("Remove favorite volunteering to firestore", () async {
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

    final volunteeringRemoteDataSource = VolunteeringRemoteDataSourceImpl(
      firebaseDatabaseClient: fakeFirebaseFirestore,
    );

    final mockDocumentReference = fakeFirebaseFirestore
        .collection(AppUserEntity.collectionName)
        .doc("1")
        .collection("favoriteVolunteerings")
        .doc("favoriteVolunteerings");

    await mockDocumentReference.set({
      "favorites": ["1"]
    });

    await volunteeringRemoteDataSource.removeFavoriteVolunteering(
        userId: "1", volunteeringId: "1");

    final response = await mockDocumentReference.get();

    final favorites = List<String>.from(response['favorites']);

    expect(favorites.length, 0);
  });

  test("Get favorite volunteerings from firestore", () async {
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

    final volunteeringRemoteDataSource = VolunteeringRemoteDataSourceImpl(
      firebaseDatabaseClient: fakeFirebaseFirestore,
    );

    final mockDocumentReference = fakeFirebaseFirestore
        .collection(AppUserEntity.collectionName)
        .doc("1")
        .collection("favoriteVolunteerings")
        .doc("favoriteVolunteerings");

    await mockDocumentReference.set({
      "favorites": ["1"]
    });

    final actualFavoriteVolunteerings =
        await volunteeringRemoteDataSource.getFavoriteVolunteerings(
      userId: "1",
    );

    final expectedFavoriteVolunteerings = ["1"];

    expect(actualFavoriteVolunteerings, expectedFavoriteVolunteerings);
  });
}
