// ignore_for_file: slash_for_doc_comments
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:middoman/navigation_bar/tab_bar_screen.dart';

// profile creation local imports
import 'package:middoman/profile_creation/account_details.dart';
import 'package:middoman/profile_creation/header_title.dart';
import 'package:middoman/profile_creation/image_choice.dart';
import 'package:middoman/profile_creation/profile_image.dart';
import 'package:middoman/profile_creation/save_button.dart';

/**
 * The profile creation section should update the data base
 * The view profile section should then update itself from the database
 * Any changes made in the view profile section will then update the database
 */

// Display Create Profile
class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});
  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  var userEmail = "";
  
  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    userEmail = FirebaseAuth.instance.currentUser!.email.toString();
  }

  /**************************PROFILE IMAGE SETTINGS************************/
  /**************************PROFILE IMAGE SETTINGS************************/
  // global image variable
  File? _image;

  Future _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? imageTemp = File(image.path);
    imageTemp = await _cropImage(imageFile: imageTemp);
    setState(() {
      _image = imageTemp;
    });
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showImageChoice(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: ImageChoice(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }
  /**************************END PROFILE IMAGE SETTINGS************************/
  /**************************END PROFILE IMAGE SETTINGS************************/

  /*********************TEXTFIELD & DATABASE SETTINGS**********************/
  /*********************TEXTFIELD & DATABASE SETTINGS**********************/
  // variables that can be used for database functionality
  var firstName = "";
  var lastName = "";

  late final TextEditingController _firstNameController = TextEditingController(text: firstName);
  late final TextEditingController _lastNameController = TextEditingController(text: lastName);

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _finishProfile() {
    firstName = _firstNameController.text;
    lastName = _lastNameController.text;
    _saveProfile();
    _navigateToNextScreen(context);
    //print("First Name Value Is Now: $firstName");
    //print("Last Name Value Is Now: $lastName");
  }

  void _cancelProfile() {
    setState(() {
      _firstNameController.text = "";
      _lastNameController.text = "";
    });
    _image = null;
    firstName = _firstNameController.text;
    lastName = _lastNameController.text;

    //print("First Name Value Is Now: $firstName");
    //print("Last Name Value Is Now: $lastName");
  }

  // data validation
  Object? _saveValidData() {
    if (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty) {
      return Fluttertoast.showToast(
        msg: "Name fields cannot Be blank",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (_firstNameController.text.characters.length <= 2 || _lastNameController.text.characters.length <= 2) {
      return Fluttertoast.showToast(
        msg: "Names must have at least 3 characters",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (_image == null) {
      return Fluttertoast.showToast(
        msg: "Please create a profile image",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      // finish and navigate to next screen
      _finishProfile();
    }
    return null;
  }

  Future<void> _saveProfile() async {
    var client = http.Client();
    var uri = Uri.parse('https://my-first-app-249520.uk.r.appspot.com/users/$userEmail');
    await client.patch(
      uri,
      body: {
        'user_first_name': _firstNameController.text.trim(),
        'user_last_name': _lastNameController.text.trim(),
        'user_profile_image': _image?.path,
      },
    );
  }
  /*********************TEXTFIELD & DATABASE SETTINGS**********************/
  /*********************TEXTFIELD & DATABASE SETTINGS**********************/

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>  const TabBarScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 244, 238),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: HeaderTitle(
                      title: "Create Profile",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: Stack(
                      children: [
                        ProfileImage(
                          backgroundImage: null,
                          onPressed: () {
                            _showImageChoice(context);
                          },
                          child: const Icon(
                            Icons.account_circle,
                            size: 180,
                            color: Color.fromARGB(255, 58, 59, 123),
                          ),
                        ),
                        if (_image != null)
                          ProfileImage(
                            backgroundImage: null,
                            onPressed: () {
                              _showImageChoice(context);
                            },
                            child: CircleAvatar(
                              radius: 80,
                              backgroundImage: FileImage(_image!),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: AccountDetail(
                      textLabel: "Enter First Name",
                      userController: _firstNameController,
                      suffixIcon: const Icon(Icons.edit),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: AccountDetail(
                      textLabel: "Enter Last Name",
                      userController: _lastNameController,
                      suffixIcon: const Icon(Icons.edit),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 30, 0),
                        child: EndButton(
                          onPressed: () {
                            _cancelProfile();
                            // Navigate to the last screen
                          },
                          userColor: Colors.white,
                          textColor: Colors.blue,
                          buttonName: "Reset Profile",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
                        child: EndButton(
                          onPressed: () {
                            _saveValidData();
                          },
                          userColor: const Color.fromARGB(255, 58, 59, 123),
                          textColor: Colors.blue,
                          buttonName: "Save Profile",
                          // add contrasting text colors
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
