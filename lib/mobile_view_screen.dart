import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:rive/rive.dart';

import 'package:women_day/core/app_colors_const.dart';
import 'package:women_day/core/app_styles_const.dart';

class MobileViewScreen extends StatefulWidget {
  const MobileViewScreen({super.key});

  @override
  State<MobileViewScreen> createState() => _MobileViewScreenState();
}

class _MobileViewScreenState extends State<MobileViewScreen> {
  final colorBG = const Color(0xFFf9ead7);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBG,
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('cute.jpg'), fit: BoxFit.cover)),
            child: Stack(
              children: [
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Happy Women`s Day',
                      style: AppStyles.s32w700.copyWith(color: AppColors.dark),
                    ),
                    ClipOval(
                      child: GifView.asset(
                        'assets/black.gif',
                        height: size.height * .4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '7/125 Group!',
                      style: AppStyles.s32w700.copyWith(color: AppColors.dark),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Заранее поздравляя вас с наступающим праздником, приглашаем вас провести время в нашей компании',
                        style:
                            AppStyles.s18w700.copyWith(color: AppColors.dark),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .8,
                      child: const Divider(
                        height: 5,
                        thickness: 2,
                        color: AppColors.dark,
                      ),
                    ),
                    Text(
                      '4 Март, ул. Ермека Серкебаева 17',
                      style: AppStyles.s18w700.copyWith(color: AppColors.dark),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 100,
                          width: 100,
                          child: RiveAnimation.asset(
                              'assets/happy_flower_port.riv'),
                        ),
                        SizedBox(
                          height: 100,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              GifView.asset('assets/car.gif'),
                              const Positioned(
                                bottom: 0,
                                child: Text(
                                  '(Олжас несет цветы)',
                                  style: AppStyles.s10w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                          width: 100,
                          child: RiveAnimation.asset(
                              'assets/happy_flower_port.riv'),
                        ),
                      ],
                    ),
                  ],
                ),
                const Positioned(
                    child: RiveAnimation.asset('assets/magic_plant.riv')),
              ],
            ),
          ),
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('names').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<GroupNames> admins = [];
                  for (QueryDocumentSnapshot<Map<String, dynamic>> category
                      in snapshot.data!.docs) {
                    admins.add(GroupNames.fromMap(category.data()));
                  }
                  return Column(
                    children: [
                      ButtonActivateWidget(
                        name: 'Алтынай',
                        isActive: admins
                            .singleWhere((element) => element.name == 'altynai')
                            .isActive,
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('names')
                              .doc('altynai')
                              .update({'isActive': true});
                        },
                      ),
                      ButtonActivateWidget(
                        name: 'Азиза',
                        isActive: admins
                            .singleWhere((element) => element.name == 'aziza')
                            .isActive,
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('names')
                              .doc('aziza')
                              .update({'isActive': true});
                        },
                      ),
                      ButtonActivateWidget(
                        name: 'Гульсая',
                        isActive: admins
                            .singleWhere((element) => element.name == 'gulsaya')
                            .isActive,
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('names')
                              .doc('gulsaya')
                              .update({'isActive': true});
                        },
                      ),
                      ButtonActivateWidget(
                        name: 'Арайлым',
                        isActive: admins
                            .singleWhere((element) => element.name == 'arai')
                            .isActive,
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('names')
                              .doc('arai')
                              .update({'isActive': true});
                        },
                      ),
                      ButtonActivateWidget(
                        name: 'Таңшолпан',
                        isActive: admins
                            .singleWhere((element) => element.name == 'wolpan')
                            .isActive,
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('names')
                              .doc('wolpan')
                              .update({'isActive': true});
                        },
                      ),
                      ButtonActivateWidget(
                        name: 'Аяулым',
                        isActive: admins
                            .singleWhere((element) => element.name == 'ayau')
                            .isActive,
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('names')
                              .doc('ayau')
                              .update({'isActive': true});
                        },
                      ),
                      ButtonActivateWidget(
                        name: 'Саяжан',
                        isActive: admins
                            .singleWhere((element) => element.name == 'sayajan')
                            .isActive,
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('names')
                              .doc('sayajan')
                              .update({'isActive': true});
                        },
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }
}

class ButtonActivateWidget extends StatelessWidget {
  const ButtonActivateWidget({
    Key? key,
    required this.name,
    this.onPressed,
    this.isActive = false,
  }) : super(key: key);
  final String name;
  final GestureTapCallback? onPressed;
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: MaterialButton(
        color: isActive! ? AppColors.green : AppColors.primary,
        onPressed: onPressed,
        child: Text(
          name,
          style: AppStyles.s40w700.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}

class GroupNames {
  final String? name;
  final bool? isActive;
  GroupNames({
    this.name,
    this.isActive,
  });

  GroupNames copyWith({
    String? name,
    bool? isActive,
  }) {
    return GroupNames(
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (isActive != null) {
      result.addAll({'isActive': isActive});
    }

    return result;
  }

  factory GroupNames.fromMap(Map<String, dynamic> map) {
    return GroupNames(
      name: map['name'],
      isActive: map['isActive'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupNames.fromJson(String source) =>
      GroupNames.fromMap(json.decode(source));

  @override
  String toString() => 'GroupNames(name: $name, isActive: $isActive)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GroupNames &&
        other.name == name &&
        other.isActive == isActive;
  }

  @override
  int get hashCode => name.hashCode ^ isActive.hashCode;
}
