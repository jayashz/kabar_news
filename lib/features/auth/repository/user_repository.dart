import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _token = 'asdfs';

  String get token => _token;

  Future<Either<String, UserCredential>> signIn(
      {required String email, required String password}) async {
    try {
      final res = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print(res);
      return Right(res);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? "Error in signin");
    } catch (e) {
      return Left("Unable to login");
    }
  }

  Future<UserCredential> createAccount(
      {required String email, required String password}) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> logout() async {
    return await firebaseAuth.signOut();
  }
}
