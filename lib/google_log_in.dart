import 'package:flutter/material.dart';
import 'package:flutter_supbase_google_login/profile_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';





class GoogleLogInScreen extends StatefulWidget {
  const GoogleLogInScreen({super.key});

  @override
  State<GoogleLogInScreen> createState() => _GoogleLogInScreenState();
}

class _GoogleLogInScreenState extends State<GoogleLogInScreen> {

  // Get a reference your Supabase client
  final supabase = Supabase.instance.client;




  Future<void> _nativeGoogleSignIn() async {
    /// TODO: update the Web client ID with your own.
    ///
    /// Web Client ID that you registered with Google Cloud.
    const webClientId = '1033315445315-v48cmv6btp49fg5ma5d9n4o0afucf2eu.apps.googleusercontent.com';

    /// TODO: update the iOS client ID with your own.
    ///
    // / iOS Client ID that you registered with Google Cloud.
    const iosClientId = '1033315445315-fe7m85adof9sdhu5fvqlie5gk5cagmaf.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  void initState() {
    _setupAuthListener();
    super.initState();
  }

  signinwithgoogleSupabase() async {
    await supabase.auth.signInWithOAuth(
      OAuthProvider.google,
    );
  }

  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
      }
    }
    );
  }

  Future<AuthResponse> _googleSignIn() async {
    /// TODO: update the Web client ID with your own.
    ///
    /// Web Client ID that you registered with Google Cloud.
    const webClientId = '1033315445315-1vd64q2jknmrkoimo9tb6k7vo6963jua.apps.googleusercontent.com';

    /// TODO: update the iOS client ID with your own.
    ///
    /// iOS Client ID that you registered with Google Cloud.
    const iosClientId = '1033315445315-fe7m85adof9sdhu5fvqlie5gk5cagmaf.apps.googleusercontent.com';

    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _googleSignIn,
          child: const Text('Google login'),
        ),
      ),
    );
  }
}
