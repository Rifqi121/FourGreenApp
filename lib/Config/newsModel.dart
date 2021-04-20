class Product {
  String id;
  String judul;
  String img;
  String deskripsi;

  Product({this.id, this.judul, this.img,this.deskripsi});

  Product.fromMap(Map snapshot,String id) :
        id = id ?? '',
        judul = snapshot['judul'] ?? '',
        img = snapshot['img'] ?? '',
        deskripsi = snapshot['deskripsi'] ?? '';

  toJson() {
    return {
      "judul": judul,
      "img": img,
      "deskripsi": deskripsi,
    };
  }
}