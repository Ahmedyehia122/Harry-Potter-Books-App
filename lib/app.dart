import 'package:bookly_app/core/class/service_locator.dart';
import 'package:bookly_app/core/constants/fonts.dart';
import 'package:bookly_app/core/constants/routes.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/manager/best_seller_books_list_view/best_seller_books_list_view_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/books_list_view_cubit/books_list_view_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BooksListViewCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchBooksListView(),
            ),
            BlocProvider(
              create: (context) => BestSellerBooksListViewCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchBestSellerBooksListview(),
            ),
            BlocProvider(
              create: (context) => SimilarBooksCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchSimilarBooksListView(),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark,
              fontFamily: AppFonts.montserrat,
            ),
            routerConfig: AppRoutes.router,
          ),
        ));
  }
}
