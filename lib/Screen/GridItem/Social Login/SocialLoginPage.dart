import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:flutter_ui_components/Route/Routes.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';

class SocialLoginPage extends StatefulWidget {
   String title;
   SocialLoginPage({super.key,this.title = 'Social Login'});

  @override
  State<SocialLoginPage> createState() => _SocialLoginPageState();
}

class _SocialLoginPageState extends State<SocialLoginPage> {
//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     // Optional clientId
//     // clientId: 'your-client_id.apps.googleusercontent.com',
//     scopes: [
//       'email',
//       'https://www.googleapis.com/auth/contacts.readonly',],
//   );
//   GoogleSignInAccount? _currentUser;
//   bool _isAuthorized = false; // has granted permissions?
//   String _contactText = '';
//
//   @override
//   void initState() {
//     super.initState();
//
//     _googleSignIn.onCurrentUserChanged
//         .listen((GoogleSignInAccount? account) async {
// // #docregion CanAccessScopes
//       // In mobile, being authenticated means being authorized...
//       bool isAuthorized = account != null;
//       // However, on web...
//       if (kIsWeb && account != null) {
//         isAuthorized = await _googleSignIn.canAccessScopes([
//           'email',
//           'https://www.googleapis.com/auth/contacts.readonly',] );
//       }
// // #enddocregion CanAccessScopes
//
//       setState(() {
//         _currentUser = account;
//         _isAuthorized = isAuthorized;
//       });
//
//       // Now that we know that the user can access the required scopes, the app
//       // can call the REST API.
//       if (isAuthorized) {
//         unawaited(_handleGetContact(account!));
//       }
//     });
//
//     // In the web, _googleSignIn.signInSilently() triggers the One Tap UX.
//     //
//     // It is recommended by Google Identity Services to render both the One Tap UX
//     // and the Google Sign In button together to "reduce friction and improve
//     // sign-in rates" ([docs](https://developers.google.com/identity/gsi/web/guides/display-button#html)).
//     _googleSignIn.signInSilently();
//   }
//
//   // Calls the People API REST endpoint for the signed-in user to retrieve information.
//   Future<void> _handleGetContact(GoogleSignInAccount user) async {
//     setState(() {
//       _contactText = 'Loading contact info...';
//     });
//     final http.Response response = await http.get(
//       Uri.parse('https://people.googleapis.com/v1/people/me/connections'
//           '?requestMask.includeField=person.names'),
//       headers: await user.authHeaders,
//     );
//     if (response.statusCode != 200) {
//       setState(() {
//         _contactText = 'People API gave a ${response.statusCode} '
//             'response. Check logs for details.';
//       });
//       print('People API ${response.statusCode} response: ${response.body}');
//       return;
//     }
//     final Map<String, dynamic> data =
//     json.decode(response.body) as Map<String, dynamic>;
//     final String? namedContact = _pickFirstNamedContact(data);
//     setState(() {
//       if (namedContact != null) {
//         _contactText = 'I see you know $namedContact!';
//       } else {
//         _contactText = 'No contacts to display.';
//       }
//     });
//   }
//
//   String? _pickFirstNamedContact(Map<String, dynamic> data) {
//     final List<dynamic>? connections = data['connections'] as List<dynamic>?;
//     final Map<String, dynamic>? contact = connections?.firstWhere(
//           (dynamic contact) => (contact as Map<Object?, dynamic>)['names'] != null,
//       orElse: () => null,
//     ) as Map<String, dynamic>?;
//     if (contact != null) {
//       final List<dynamic> names = contact['names'] as List<dynamic>;
//       final Map<String, dynamic>? name = names.firstWhere(
//             (dynamic name) =>
//         (name as Map<Object?, dynamic>)['displayName'] != null,
//         orElse: () => null,
//       ) as Map<String, dynamic>?;
//       if (name != null) {
//         return name['displayName'] as String?;
//       }
//     }
//     return null;
//   }
//
//   // This is the on-click handler for the Sign In button that is rendered by Flutter.
//   //
//   // On the web, the on-click handler of the Sign In button is owned by the JS
//   // SDK, so this method can be considered mobile only.
//   // #docregion SignIn
//   Future<void> _handleSignIn() async {
//     try {
//       await _googleSignIn.signIn();
//     } catch (error) {
//       print(error);
//     }
//   }
//   // #enddocregion SignIn
//
//   // Prompts the user to authorize `scopes`.
//   //
//   // This action is **required** in platforms that don't perform Authentication
//   // and Authorization at the same time (like the web).
//   //
//   // On the web, this must be called from an user interaction (button click).
//   // #docregion RequestScopes
//   Future<void> _handleAuthorizeScopes() async {
//     final bool isAuthorized = await _googleSignIn.requestScopes([
//       'email',
//       'https://www.googleapis.com/auth/contacts.readonly',]);
//     // #enddocregion RequestScopes
//     setState(() {
//       _isAuthorized = isAuthorized;
//     });
//     // #docregion RequestScopes
//     if (isAuthorized) {
//       unawaited(_handleGetContact(_currentUser!));
//     }
//     // #enddocregion RequestScopes
//   }
//
//   Future<void> _handleSignOut() => _googleSignIn.disconnect();
//
//   Widget _buildBody() {
//     final GoogleSignInAccount? user = _currentUser;
//     if (user != null) {
//       // The user is Authenticated
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           ListTile(
//             leading: GoogleUserCircleAvatar(
//               identity: user,
//             ),
//             title: Text(user.displayName ?? ''),
//             subtitle: Text(user.email),
//           ),
//           const Text('Signed in successfully.'),
//           if (_isAuthorized) ...<Widget>[
//             // The user has Authorized all required scopes
//             Text(_contactText),
//             ElevatedButton(
//               child: const Text('REFRESH'),
//               onPressed: () => _handleGetContact(user),
//             ),
//           ],
//           if (!_isAuthorized) ...<Widget>[
//             // The user has NOT Authorized all required scopes.
//             // (Mobile users may never see this button!)
//             const Text('Additional permissions needed to read your contacts.'),
//             ElevatedButton(
//               onPressed: _handleAuthorizeScopes,
//               child: const Text('REQUEST PERMISSIONS'),
//             ),
//           ],
//           ElevatedButton(
//             onPressed: _handleSignOut,
//             child: const Text('SIGN OUT'),
//           ),
//         ],
//       );
//     } else {
//       // The user is NOT Authenticated
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           const Text('You are not currently signed in.'),
//           // This method is used to separate mobile from web code with conditional exports.
//           // See: src/sign_in_button.dart
//           // buildSignInButton(
//           //   onPressed: _handleSignIn,
//           // ),
//         ],
//       );
//     }
//   }
  @override
  Widget build(BuildContext context) {
    List socialList = ["Firebase Phone Authentication","Google Login","Facebook Login"];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Image.asset(ImagePath.bgimg,fit: BoxFit.cover,height: double.infinity,),
              Padding( padding: EdgeInsets.all(5.w),
                child: Container(
                  height: 72.h,
                  child:ListView.builder(
                    itemCount: socialList.length,shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.all(2.w),
                        child: InkWell(
                          onTap: () {
                            switch(index){
                              case 0:
                                Get.toNamed(Routes.firebasePhoneAuthenticationScreen);
                                break;
                              case 1:
                                Get.toNamed(Routes.googleLoginScreen);
                                break;
                              case 2:
                                Get.toNamed(Routes.facebookLoginScreen);
                                break;
                            }
                          },
                          child: Container(width: 80.w,height: 8.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.w),
                              image: DecorationImage(
                                image: AssetImage(ImagePath.conImg,),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                socialList[index],
                                style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
