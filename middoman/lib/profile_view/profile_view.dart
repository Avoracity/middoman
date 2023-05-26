// ignore_for_file: slash_for_doc_comments
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// profile view local imports
import 'package:middoman/profile_creation/account_details.dart';
import 'package:middoman/profile_creation/image_choice.dart';
import 'package:middoman/profile_creation/profile_image.dart';
import 'package:middoman/profile_creation/save_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  /**************************VARIABLES************************/
  /**************************VARIABLES************************/
  File? _image;
  File? _image2;
  String userEmail = "";
  String _databaseFirstName = "";
  String _databaseLastName = "";
  File? _databaseImage;
   var _visibilityStatus = false;
  /**************************VARIABLES************************/
  /**************************VARIABLES************************/

  /**************************PROFILE IMAGE SETTINGS************************/
  /**************************PROFILE IMAGE SETTINGS************************/

  Future _pickImage(ImageSource source) async {
    // use this to check for image changes
    _image2 = _image;
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? imageTemp = File(image.path);
    imageTemp = await _cropImage(imageFile: imageTemp);
    setState(() {
      _image = imageTemp;
      if (_image2 != _image) {
        _changeVisiblity();
      }
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

  /**************************PROFILE IMAGE SETTINGS************************/
  /**************************PROFILE IMAGE SETTINGS************************/

  /*********************TEXTFIELD & DATABASE SETTINGS**********************/
  /*********************TEXTFIELD & DATABASE SETTINGS**********************/

  // initialize textfields with database get - maybe remove 'late' in case of errors
  late final TextEditingController _firstNameController = TextEditingController();
  late final TextEditingController _lastNameController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController(text: userEmail);

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    userEmail = FirebaseAuth.instance.currentUser!.email.toString();
    _loadFirstName();
    _loadLastName();
    _loadImage();
    _firstNameController.addListener(_changeVisiblity);
    _lastNameController.addListener(_changeVisiblity);
  }

  Future<void> _loadFirstName() async {
    var client = http.Client();
    var uriFirstName = Uri.parse('https://my-first-app-249520.uk.r.appspot.com/users/$userEmail/user_first_name');
    var databaseFirstName = await client.get(uriFirstName);
    _databaseFirstName = databaseFirstName.body.toString().replaceAll('"', '').trim();
    _firstNameController.text = _databaseFirstName;
  }

  Future<void> _loadLastName() async {
    var client = http.Client();
    var uriLastName = Uri.parse('https://my-first-app-249520.uk.r.appspot.com/users/$userEmail/user_last_name');
    var databaseLastName = await client.get(uriLastName);
    _databaseLastName = databaseLastName.body.toString().replaceAll('"', '').trim();
    _lastNameController.text = _databaseLastName;
  }

  Future<void> _loadImage() async {
    var client = http.Client();
    var uriLastName = Uri.parse('https://my-first-app-249520.uk.r.appspot.com/users/$userEmail/user_profile_image');
    var databaseImage = await client.get(uriLastName);
    String love = databaseImage.body.replaceAll('"', '').trim();
    _databaseImage = File(love);
    _image = _databaseImage;
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

  // cleanup
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  // visiblity settings
  void _changeVisiblity() {
    setState(() {
      if (_firstNameController.text == _databaseFirstName && _lastNameController.text == _databaseLastName && _image == _databaseImage) {
        _visibilityStatus = false;
      } else {
        _visibilityStatus = true;
      }
    });
  }

  void _saveChanges() {
    _saveProfile();
    setState(() {
      // ignore: todo
      //TODO: reset textfield to prechange version
      _visibilityStatus = false;
    });
  }

  void _resetChanges() {
    setState(() {
      _visibilityStatus = false;
    });
    _image = _databaseImage;
    _firstNameController.text = _databaseFirstName;
    _lastNameController.text = _databaseLastName;
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
      _saveChanges();
    }
    return null;
  }
  /*********************TEXTFIELD & DATABASE SETTINGS**********************/
  /*********************TEXTFIELD & DATABASE SETTINGS**********************/

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 30, 30),
              child: AccountDetail(
                textLabel: "First Name",
                userController: _firstNameController,
                suffixIcon: const Icon(Icons.edit),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 30, 30),
              child: AccountDetail(
                textLabel: "Last Name",
                userController: _lastNameController,
                suffixIcon: const Icon(Icons.edit),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 30, 30),
              child: AccountDetail(
                textLabel: "Email",
                userController: _emailController,
                suffixIcon: const Icon(Icons.email),
                enabled: false,
              ),
            ),
            //if (_firstNameController.text != test){}
            Visibility(
              visible: _visibilityStatus,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 30, 0),
                      child: EndButton(
                        onPressed: () {
                          _resetChanges();
                          // Navigate to the last screen
                        },
                        userColor: Colors.white,
                        textColor: const Color.fromARGB(255, 58, 59, 123),
                        buttonName: "Reset",
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
                      child: EndButton(
                        onPressed: () {
                          _saveValidData();
                        },
                        userColor: const Color.fromARGB(255, 58, 59, 123),
                        textColor: Colors.white,
                        buttonName: "Save Profile",
                        // add contrasting text colors
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
