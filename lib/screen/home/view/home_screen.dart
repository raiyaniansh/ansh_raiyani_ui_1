import 'package:ansh_raiyani_ui_1/screen/home/controller/home_controller.dart';
import 'package:ansh_raiyani_ui_1/screen/home/modal/home_modal.dart';
import 'package:ansh_raiyani_ui_1/utils/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiHelper apiHelper = ApiHelper();
  HomeController homeController = Get.put(HomeController());
  List<dynamic> productlist = [];
  Map? stortprodcut;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text("Oceanmtech",
                style: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          body: Padding(
            padding: EdgeInsets.all(1.h),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          homeController.atoz.value=!homeController.atoz.value;
                        },
                        child: Obx(
                          () =>  Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            child: Text("Name : A To Z",style: GoogleFonts.poppins(color: (homeController.atoz==true)?Colors.black:Colors.white,fontWeight: FontWeight.w600,fontSize: 12.sp),),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              color: (homeController.atoz==false)?Colors.black:Colors.white,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          homeController.ztoa.value=!homeController.ztoa.value;
                        },
                        child: Obx(
                              () =>  Container(
                            padding: EdgeInsets.all(5),
                            child: Text("Name : Z To A",style: GoogleFonts.poppins(color: (homeController.ztoa==true)?Colors.black:Colors.white,fontWeight: FontWeight.w600,fontSize: 12.sp),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (homeController.ztoa==false)?Colors.black:Colors.white,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          homeController.cata.value=!homeController.cata.value;
                        },
                        child: Obx(
                              () =>  Container(
                            padding: EdgeInsets.all(5),
                            child: Text("Category : A To Z",style: GoogleFonts.poppins(color: (homeController.cata==true)?Colors.black:Colors.white,fontWeight: FontWeight.w600,fontSize: 12.sp),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (homeController.cata==false)?Colors.black:Colors.white,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          homeController.catz.value=!homeController.catz.value;
                        },
                        child: Obx(
                              () =>  Container(
                            padding: EdgeInsets.all(5),
                            child: Text("Category : Z To A",style: GoogleFonts.poppins(color: (homeController.catz==true)?Colors.black:Colors.white,fontWeight: FontWeight.w600,fontSize: 12.sp),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (homeController.catz==false)?Colors.black:Colors.white,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          homeController.rat.value=!homeController.rat.value;
                        },
                        child: Obx(
                              () =>  Container(
                            padding: EdgeInsets.all(5),
                            child: Text("Rate : A To Z",style: GoogleFonts.poppins(color: (homeController.rat==true)?Colors.black:Colors.white,fontWeight: FontWeight.w600,fontSize: 12.sp),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (homeController.rat==false)?Colors.black:Colors.white,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          homeController.lh.value=!homeController.lh.value;
                        },
                        child: Obx(
                              () =>  Container(
                            padding: EdgeInsets.all(5),
                            child: Text("Price : Low To High",style: GoogleFonts.poppins(color: (homeController.lh==true)?Colors.black:Colors.white,fontWeight: FontWeight.w600,fontSize: 12.sp),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (homeController.lh==false)?Colors.black:Colors.white,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          homeController.hl.value=!homeController.hl.value;
                        },
                        child: Obx(
                              () =>  Container(
                            padding: EdgeInsets.all(5),
                            child: Text("Price : High To Low",style: GoogleFonts.poppins(color: (homeController.hl==true)?Colors.black:Colors.white,fontWeight: FontWeight.w600,fontSize: 12.sp),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (homeController.hl==false)?Colors.black:Colors.white,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("${snapshot.error}"));
                    } else if (snapshot.hasData) {
                      var data = snapshot.data!.productData;
                      for (var x in data!) {
                        ProductDatum products = ProductDatum(
                          id: x.id,
                          averageRating: x.averageRating,
                          categoryName: x.categoryName,
                          image: x.image,
                          name: x.name,
                          price: x.price,
                        );
                        productlist.add(products);
                      }
                      return Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Container(
                                    height: 80,
                                    width: 80,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "${productlist[index].image}",
                                          fit: BoxFit.cover,
                                        ))),
                                SizedBox(
                                  width: 1.h,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 70.w,
                                      child: Text(
                                        "${productlist[index].name}",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: 70.w,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Categoty : ",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${productlist[index].categoryName}",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: 10.sp,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 70.w,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Price : ",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${productlist[index].price}",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: 10.sp,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 70.w,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Rate : ",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${productlist[index].averageRating}",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: 10.sp,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          itemCount: productlist.length,
                        ),
                      );
                    }
                    return Expanded(child: Center(child: CircularProgressIndicator(color: Colors.black,)));
                  },
                  future: apiHelper.apicall(),
                )
              ],
            ),
          )),
    );
  }
}
