import 'package:acne_detection/ViewModel/Category_View_Model.dart';
import 'package:acne_detection/Views/Detail_Screen.dart';
import 'package:flutter/material.dart';
import 'package:acne_detection/Common/style.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget body(CategoryViewModel viewModel) {
    return SizedBox(
      height: 600,
      // height: 400,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 220,
        ),
        itemCount: viewModel.list.length,
        itemBuilder: (context, index){
          final category = viewModel.list[index];
          return InkWell(
            // onTap: () {
            //   // Navigator.of(context).push(
            //   // MaterialPageRoute(builder: (_) => DetailPage(buildingModel: building,)));
            // },
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => DetailPage(
                    categoryModel: category,
                  )));
            },
            child: Card(
              color: ColorStyles.primaryColor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Container(
                padding: EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        "${category.img}",
                        height: 149,
                        width: 260,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${category.name}",
                      maxLines: 2,
                      style:
                      TextStyle(
                          fontSize: 14,
                          fontFamily: 'avenir',
                          color: ColorStyles.textColor,
                          fontWeight: FontWeight.w800),
                      // overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Selengkapnya...',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'avenir',
                          color: ColorStyles.textColor),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        padding: const EdgeInsets.all(10),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    CategoryViewModel viewModel = Provider.of<CategoryViewModel>(context);
    return body(viewModel);
  }
}
