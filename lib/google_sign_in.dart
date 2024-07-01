import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddGoogleAccount extends StatefulWidget {
  const AddGoogleAccount({super.key});

  @override
  State<AddGoogleAccount> createState() => _AddGoogleAccountState();
}

class _AddGoogleAccountState extends State<AddGoogleAccount> {

  // Get a reference your Supabase client
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    // _setupAuthListener();
    super.initState();
  }

  signinwithgoogleSupabase() async {
    await supabase.auth.signInWithOAuth(
      OAuthProvider.google,
    );
  }

  // void _setupAuthListener() {
  //   supabase.auth.onAuthStateChange.listen((data) {
  //     final event = data.event;
  //     if (event == AuthChangeEvent.signedIn) {
  //       // Navigator.of(context).pushReplacement(
  //       //   MaterialPageRoute(
  //       //     builder: (context) => const ProfileScreen(),
  //       //   ),
  //       // );
  //     }
  //   }
  //   );
  // }

  // Future<AuthResponse> _googleSignIn() async {
  //   /// TODO: update the Web client ID with your own.
  //   ///
  //   /// Web Client ID that you registered with Google Cloud.
  //   const webClientId = 'my-web.apps.googleusercontent.com';
  //
  //   /// TODO: update the iOS client ID with your own.
  //   ///
  //   /// iOS Client ID that you registered with Google Cloud.
  //   const iosClientId = 'my-ios.apps.googleusercontent.com';
  //
  //   // Google sign in on Android will work without providing the Android
  //   // Client ID registered on Google Cloud.
  //
  //   final GoogleSignIn googleSignIn = GoogleSignIn(
  //     clientId: iosClientId,
  //     serverClientId: webClientId,
  //   );
  //   final googleUser = await googleSignIn.signIn();
  //   final googleAuth = await googleUser!.authentication;
  //   final accessToken = googleAuth.accessToken;
  //   final idToken = googleAuth.idToken;
  //
  //   if (accessToken == null) {
  //     throw 'No Access Token found.';
  //   }
  //   if (idToken == null) {
  //     throw 'No ID Token found.';
  //   }
  //
  //   return supabase.auth.signInWithIdToken(
  //     provider: OAuthProvider.google,
  //     idToken: idToken,
  //     accessToken: accessToken,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: signinwithgoogleSupabase,
          child: const Text('Google login'),
        ),
      ),
    );
  }
}
