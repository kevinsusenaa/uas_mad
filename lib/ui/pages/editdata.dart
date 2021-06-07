part of 'pages.dart';

class EditData extends StatefulWidget {
  @override
  _EditDataState createState() => _EditDataState();
  static const String routeName = "/dataedit";
}

class _EditDataState extends State<EditData> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isVisible = true;
  String password = '';

  @override
  Widget build(BuildContext context) {
    Products products = ModalRoute.of(context).settings.arguments;
    final ctrlName = TextEditingController(text: products.productName);
    final ctrlDesc = TextEditingController(text: products.productDescription);
    final ctrlPrice = TextEditingController(text: products.productPrice);
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Color(0xFF448AFF),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Center(
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: ElevatedButton(
                onPressed: () async {
                  //save task
                  bool validated = _formKey.currentState.validate();
                  if (validated) {
                    _formKey.currentState.save();
                    final data =
                        Map<String, dynamic>.from(_formKey.currentState.value);
                    data['data_id'] = FirebaseAuth.instance.currentUser.uid;
                    // data['user_id'] = context.read(userRepoProvider).user.id;
                    // if (users == null) {
                    //   await taskDBS.create(data);
                    // } else {
                    //   //edit update
                    //   await taskDBS.updateData(users.uid, data);
                    // }
                    Products products = Products(
                        "",
                        ctrlName.text,
                        ctrlDesc.text,
                        ctrlPrice.text,
                        ctrlPrice.text,
                        ctrlPrice.text,
                         
                        
                        
                        
                        "",
                        "");
                    await ProductServices.editData(products).then((value) =>
                        ActivityServices.showToast(
                            "Berhasil Disimpan", Colors.green));
                    // isLoading = false;
                    // Navigator.pushReplacementNamed(context, Profile.routeName);
                    Navigator.pop(context);
                  }

                  // Navigator.push(context,
                  //   new MaterialPageRoute(builder: (context) => new MyTask()));
                },
                child: Text("Save"),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF448AFF), elevation: 0, ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: ctrlName,
                    // initialValue: users?.name,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.isEmpty ? "Wajib diisi" : null;
                    },
                  ),

                  SizedBox(
                    height: 24,
                  ),
                   TextFormField(
                    controller: ctrlPrice,
                    // initialValue: users?.name,
                    decoration: InputDecoration(
                      labelText: "Status",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.emoji_objects_outlined),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.isEmpty ? "Wajib diisi" : null;
                    },
                  ),

                  

                  SizedBox(
                    height: 24,
                  ),

                 

                  SizedBox(
                    height: 24,
                  ),

                  // FormBuilderTextField(
                  //   validator: FormBuilderValidators.compose([
                  //     FormBuilderValidators.required(context),
                  //   ]),
                  //   name: "name",
                  //   controller: ctrlName,
                  //   initialValue: users?.name,
                  //   decoration: InputDecoration(
                  //     hintText: "your name...",
                  //     border: InputBorder.none,
                  //     prefixIcon: Icon(Icons.account_circle),
                  //     // contentPadding: const EdgeInsets.only(left: 48.0),
                  //   ),
                  // ),
                  // Divider(),
                  // FormBuilderTextField(
                  //   validator: FormBuilderValidators.compose([
                  //     FormBuilderValidators.required(context),
                  //     (value) {
                  //       password = value;
                  //       return value.length < 6
                  //           ? "Password must have at least 6 characters!"
                  //           : null;
                  //     },
                  //   ]),
                  //   name: "password",
                  //   initialValue: users?.password,
                  //   obscureText: isVisible,
                  //   decoration: InputDecoration(
                  //       hintText: "your password...",
                  //       border: InputBorder.none,
                  //       prefixIcon: Icon(Icons.vpn_key),
                  //       suffixIcon: new GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             isVisible = !isVisible;
                  //           });
                  //         },
                  //         child: Icon(isVisible
                  //             ? Icons.visibility
                  //             : Icons.visibility_off),
                  //       )
                  //       // contentPadding: const EdgeInsets.only(left: 48.0),
                  //       ),
                  // ),
                  // Divider(),
                  // FormBuilderTextField(
                  //   name: "description",
                  //   initialValue: users?.description,
                  //   minLines: 1,
                  //   maxLines: 5,
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     hintText: "your description...",
                  //     prefixIcon: Icon(Icons.short_text),
                  //   ),
                  // ),
                ],
              ))
        ],
      ),
    );
  }
}
