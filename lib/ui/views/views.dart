library app.ui.views;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:products_app/app/locator.dart';
import 'package:products_app/app/router.gr.dart';
import 'package:products_app/models/product_model.dart';
import 'package:products_app/services/arguments.dart';
import 'package:products_app/services/loginbloc.dart';
import 'package:products_app/services/products_service.dart';
import 'package:stacked/stacked.dart';

import '../shared/shared.dart';

part 'home/home_view.dart';
part 'home/home_viewmodel.dart';

part 'login/login_view.dart';
part 'login/login_viewmodel.dart';

part 'product/product_view.dart';
part 'product/product_viewmodel.dart';

part 'signup/signup_view.dart';
part 'signup/signup_viewmodel.dart';
