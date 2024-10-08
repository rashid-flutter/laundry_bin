import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_bin/features/serviceability/admin/controller/model/services_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_db_services.g.dart';

final class ServicesDbServices {
  static final _servicesCollection = FirebaseFirestore.instance
      .collection('services')
      .withConverter(
          fromFirestore: ServicesModel.fromFireStore,
          toFirestore: (data, options) => data.toFirestore());

  Future<void> addService(ServicesModel service) async {
    await _servicesCollection.add(service);
  }

  Future<void> updateService(ServicesModel service) async {
    await _servicesCollection.doc(service.id).set(service);
  }

  Future<void> deleteService(ServicesModel service) async {
    await _servicesCollection.doc(service.id).delete();
  }

  Stream<QuerySnapshot<ServicesModel>> getAllServices() {
    return _servicesCollection.snapshots();
  }
}

@riverpod
ServicesDbServices servicesDBServices(ServicesDBServicesRef ref) =>
    ServicesDbServices();
