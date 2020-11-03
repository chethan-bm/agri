import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

//String name;
//String email;
//String imageUrl;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;
//  final FirebaseUser user = (await _auth.signInWithCredential(credential)) as FirebaseUser;



  // Checking if email and name is null
//  assert(user.email != null);
//  assert(user.displayName != null);
//  assert(user.photoUrl != null);
//
//  name = user.displayName;
//  email = user.email;
//  imageUrl = user.photoUrl;

  // Only taking the first part of the name, i.e., First Name
//  if (name.contains(" ")) {
//    name = name.substring(0, name.indexOf(" "));
//  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

//Future < FirebaseUser > signUp(email, password) async {
//  try {
//    FirebaseUser user = await auth.createUserWithEmailAndPassword(email: email, password: password);
//    assert(user != null);
//    assert(await user.getIdToken() != null);
//    return user;
//  } catch (e) {
//    handleError(e);
//    return null;
//  }
//}
//
//Future < FirebaseUser > signIn(String email, String password) async {
//  Tzry {
//    FirebaseUser user = await auth.signInWithEmailAndPassword(email: email, password: password);
//    assert(user != null);
//    assert(await user.getIdToken() != null);
//    final FirebaseUser currentUser = await auth.currentUser();
//    assert(user.uid == currentUser.uid);
//    return user;
//  } catch (e) {
//  handleError(e);
//  return null;
//  }
//}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}