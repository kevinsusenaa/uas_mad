part of 'services.dart';

class ProductServices{

  static FirebaseAuth auth = FirebaseAuth.instance;

  //setup cloud firestore
  static CollectionReference productCollection = FirebaseFirestore.instance.collection("products");
  static DocumentReference productDocument;

  //setup storage
  static Reference ref;
  static UploadTask uploadTask;
  static String imgUrl;

  static Future<bool> addProduct(Products products, PickedFile imgFile) async{
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    productDocument = await productCollection.add({
      'productId': products.productId,
      'productName': products.productName,
      'productDescription': products.productDescription,
      'productPrice': products.productPrice,
      'productImg': products.productImg,
      'addBy': products.addBy,
      'createdAt': dateNow,
      'updatedAt': dateNow,
    });

  if(productDocument != null){
    Reference ref = FirebaseStorage.instance.ref().child("images").child(productDocument.id + ".png");
    uploadTask = ref.putFile(File(imgFile.path));

    await uploadTask.whenComplete(() => 
      ref.getDownloadURL().then((value) => imgUrl = value,)
    );

    productCollection.doc(productDocument.id).update({
      'productId': productDocument.id,
      'productImg': imgUrl,
    }
    );

    return true;
  }else{
    return false;
  }

  } 

  static Future<bool> deleteProduct(String id) async {
    bool hsl = true;
    await Firebase.initializeApp();
    await productCollection.doc(id).delete().then((value) {
      hsl = true;
    }).catchError((onError) {
      hsl = false;
    });

    return hsl;
  }
  static Future<bool> editData(Products products) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    // String uid = auth.currentUser.uid;

    await productCollection.doc(auth.currentUser.uid).update({
      'name': products.productName,
      'desc': products.productDescription,
      'status': products.productPrice,
      'updatedAt': dateNow
    });
    
    return true;
  }

}