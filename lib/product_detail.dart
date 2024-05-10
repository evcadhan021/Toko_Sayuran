import 'package:flutter/material.dart';
import 'package:toko_sayuran_flutter/data.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Detail',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.product.name,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
          ),
          Center(
            child: Hero(
              tag: widget.product.image,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.product.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Text(
                  'Rp ${widget.product.price}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  ' /${widget.product.quantity}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.product.descreption,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.bottomCenter,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (_quantity > 1) _quantity--;
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Text(
                        '$_quantity',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: 160,
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      color: Colors.green,
                    ),
                    child: const Center(
                      child: Text(
                        'Pesan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
