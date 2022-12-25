import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';

class ProductItem extends StatelessWidget {
  final int index;
  const ProductItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: NetworkImage(cubit.products[index].image),
                  width: double.infinity,
                  height: 150.0.h,
                  // fit: BoxFit.cover,
                ),
              ),
              if (cubit.products[index].discount != 0)
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    AppStrings.discount,
                    style: TextStyle(
                      fontSize: 8.0.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Container(
            height: 85.h,
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cubit.products[index].name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0.sp,
                    height: 1.3.h,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${cubit.products[index].price.round()} ${AppStrings.egp}',
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(
                          width: 5.0.w,
                        ),
                        if (cubit.products[index].discount != 0)
                          Text(
                            '${cubit.products[index].oldPrice.round()} ${AppStrings.egp}',
                            style: TextStyle(
                              fontSize: 10.0.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        // ShopCubit.get(context).changeFavorites(model.id!);
                      },
                      icon: CircleAvatar(
                        radius: 15.0.r,
                        backgroundColor: Colors.grey,
                        // (ShopCubit.get(context).favorites![model.id]!)
                        //     ? defaultColor
                        //     :
                        child: const Icon(
                          Icons.favorite_border,
                          size: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
