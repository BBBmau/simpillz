import 'package:motor_flutter/motor_flutter.dart';
import 'package:motor_flutter/motor_flutter.dart';
import 'package:motor_flutter/motor_flutter.dart';

class sonrClass {
  late Bucket BUCKET;
  late int bucketSize = 0;
  late Schema schema;

  createBucket() async {
    BUCKET = await MotorFlutter.to.createBucket("drugs");
  }

  fetchSchema(String q) async {
    schema = (await MotorFlutter.query.whatIs(
            "did:snr:05638e57-4a6a-4451-94fa-111661fb3052",
            "snr1c96tdc2gtryjhrulyqlm90dc7d6jl3gyady95l"))!
        .schema;
  }

  // getBucketSize() async {
  //   return await BUCKET.listItems().then((value) {
  //     value.length;
  //   });
  //}
}
