import 'package:flutter/material.dart';

class ScreenUtils {
  static const Size _mobileDesign = Size(375 , 812) ;
  static const Size _tabletDesign = Size(768 , 1024) ;
  static const Size _desktopDesign = Size(1440 , 900) ;

  static Size getDesignSize(BuildContext context){
    double width = MediaQuery.sizeOf(context).width ;
    if(width < 600){
      return _mobileDesign ;
    }else if(width < 1024){
      return _tabletDesign ;
    }else{
      return _desktopDesign ;
    }
  }

  static String getDeviceType(BuildContext context){
    double width = MediaQuery.sizeOf(context).width ;
    if(width < 600){
      return "mobile" ;
    }else if(width < 1024){
      return "tablet" ;
    }else{
      return "desktop" ;
    }
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 1024;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 1024;
  }

}