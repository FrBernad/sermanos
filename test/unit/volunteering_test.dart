import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sermanos/features/postulate/data/datasources/remote/volunteering_remote_data_source.dart';
import 'package:sermanos/features/postulate/data/entities/volunteering_entity.dart';
import 'package:sermanos/features/postulate/domain/models/volunteering.dart';

void main() {
  test(
    'Volunteering Entity to Model',
    () {
      VolunteeringEntity expectedVolunteeringEntity = const VolunteeringEntity(
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
      );

      Volunteering expectedVolunteeringModel = const Volunteering(
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
      );

      expect(
        expectedVolunteeringEntity.toModel(),
        expectedVolunteeringModel,
      );
    },
  );

  test("Get volunteering from firestore", () async {
    final FakeFirebaseFirestore fakeFirebaseFirestore = FakeFirebaseFirestore();

    final volunteeringRemoteDataSource = VolunteeringRemoteDataSourceImpl(
      firebaseDatabaseClient: fakeFirebaseFirestore,
    );

    final mockDocumentReference = fakeFirebaseFirestore
        .collection(VolunteeringEntity.collectionName)
        .doc("1");

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
    };

    await mockDocumentReference.set(mockVolunteeringMap);

    final actualVolunteeringEntityList =
        await volunteeringRemoteDataSource.getVolunteerings(searchTerm: null);

    final actualVolunteeringModelList =
        actualVolunteeringEntityList.map((e) => e.toModel()).toList();

    final expectedVolunteeringEntityList = [
      VolunteeringEntity.fromJson(
        volunteeringId: "1",
        json: mockVolunteeringMap,
      ),
    ];

    final expectedVolunteeringModelList =
        expectedVolunteeringEntityList.map((e) => e.toModel()).toList();

    expect(actualVolunteeringModelList, expectedVolunteeringModelList);
  });
}
