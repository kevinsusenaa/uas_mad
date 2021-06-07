part of 'pages.dart';

class ListData extends StatefulWidget {
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  String uid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");

 bool isLoading = false;
  String msg = "Fail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Activity"),
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                            image: DecorationImage(
                              
                                image: AssetImage('assets/images/run2.jpg'),
                                alignment: Alignment.center),
                                
                                
                                color: Color.fromRGBO(255, 255, 255, 0.19),
                          ),
                        ),
                        Container(
                          color: Color.fromRGBO(255, 255, 255, 0.19),
                        ),
                        Container(
                          color: Color.fromRGBO(255, 255, 255, 0.19),
                        ),
                        Container(
                          color: Color.fromRGBO(255, 255, 255, 0.19),
                        ),
                         Container(
                          color: Color.fromRGBO(255, 255, 255, 0.19),
                        ),
                        Container(
                          color: Color.fromRGBO(255, 255, 255, 0.19),
                        ),
                        Container(
                          color: Color.fromRGBO(255, 255, 255, 0.19),
                        ),
                        Container(
                          color: Color.fromRGBO(255, 255, 255, 0.19),
                        ),
                         Container(
                          color: Color.fromRGBO(255, 255, 255, 0.19),
                        ),
                         Container(
                          color: Color.fromRGBO(255, 255, 255, 0.19),
                        ),
                        
              
            
           

            Container(
      
      width: double.infinity,
      height: double.infinity,
      child: StreamBuilder<QuerySnapshot>(
        stream: productCollection.where('addBy', isEqualTo: uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Failed to load data");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return ActivityServices.loadings();
          }

          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot doc) {
              Map dat = doc.data();
              Products products = new Products(
                
                dat['productId'],
                dat['productName'],
                dat['productPrice'],
                dat['productDescription'],
                dat['productImg'],
                dat['addBy'],
                dat['createdAt'],
                dat['updatedAt'],
              );
              return ProductCard(products: products);
            }).toList(),
          );
        },
      ),
    ),
            
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ));
  }
}
