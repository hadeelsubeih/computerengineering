class Category {
  final int categoryId;
  final String name;
  Category({this.categoryId, this.name});
}

final trainCategory = Category(
  categoryId: 3,
  name: 'مجالات العمل',
);

final busCategory = Category(
  categoryId: 2,
  name: 'مشاريع تخرج',
);

final planeCategory = Category(
  categoryId: 1,
  name: 'جدول الاختبارات',
);
final trainCategory1 = Category(
  categoryId: 0,
  name: 'الرئيسية',

);
final categories = [trainCategory1,  planeCategory, busCategory,trainCategory,

];
