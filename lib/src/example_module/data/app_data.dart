import 'package:flutter/material.dart';
import 'package:sneaker_app/model/basemodel.dart';
import 'package:sneaker_app/model/categories.dart';

List<CategoriesModel> categories = [
  CategoriesModel(
    imgUrl: "assets/image/adidas.png",
    tittle: "Addidas",
  ),
  CategoriesModel(
    imgUrl: "assets/image/nike.png",
    tittle: "Nike",
  ),
  CategoriesModel(
    imgUrl: "assets/image/jordan.png",
    tittle: "Jordan",
  ),
  CategoriesModel(
    imgUrl: "assets/image/reebok.png",
    tittle: "Reebok",
  ),
  CategoriesModel(
    imgUrl: "assets/image/puma.png",
    tittle: "Puma",
  ),
];

List<BaseModel> sneakerList = [
  BaseModel(
    dispription:
        "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials.",
    imageUrl: "assets/image/nike1.png",
    name: "Air Jordan",
    price: 155.99,
  ),
  BaseModel(
    dispription:
        "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials.",
    imageUrl: "assets/image/jordans3.png",
    name: "Air Jordan",
    price: 320.99,
  ),
  BaseModel(
    dispription:
        "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials.",
    imageUrl: "assets/image/jordans4.png",
    name: "Air Jordan",
    price: 113.99,
  ),
  BaseModel(
    dispription:
        "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials.",
    imageUrl: "assets/image/nike4.png",
    name: "Air Jordan",
    price: 178.99,
  ),
  BaseModel(
    dispription:
        "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials.",
    imageUrl: "assets/image/jordans5.png",
    name: "Air Jordan",
    price: 178.99,
  ),
  BaseModel(
      dispription:
          "Get back to the past with these coveted retros. Celebrating the '85 original, they bring back the shape that started the off-court revolution. With classic details and throwback hoops flair, they let you channel vintage style back onto the streets. The padded, high-top collar means you can take your game anywhere—in comfort.",
      imageUrl: "assets/image/af1.png",
      name: "Air Force",
      price: 105),
  BaseModel(
      dispription:
          "Get back to the past with these coveted retros. Celebrating the '85 original, they bring back the shape that started the off-court revolution. With classic details and throwback hoops flair, they let you channel vintage style back onto the streets. The padded, high-top collar means you can take your game anywhere—in comfort.",
      imageUrl: "assets/image/af2.png",
      name: "Air Force",
      price: 145.7),
  BaseModel(
      dispription:
          "Get back to the past with these coveted retros. Celebrating the '85 original, they bring back the shape that started the off-court revolution. With classic details and throwback hoops flair, they let you channel vintage style back onto the streets. The padded, high-top collar means you can take your game anywhere—in comfort.",
      imageUrl: "assets/image/af3.png",
      name: "Air Force",
      price: 135.9)
];
List gradient = [
  const LinearGradient(
    colors: [Colors.redAccent, Colors.black],
  ),
  const LinearGradient(
    colors: [Colors.yellow, Colors.black],
  ),
  const LinearGradient(
    colors: [
      Colors.greenAccent,
      Colors.black,
    ],
  ),
];
