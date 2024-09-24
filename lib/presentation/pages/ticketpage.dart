import 'package:everlink_lottery_app/application/ticket_collection_provider.dart';
import 'package:everlink_lottery_app/domain/entity/ticket.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:everlink_lottery_app/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';

class TicketPage extends ConsumerStatefulWidget {
  const TicketPage({super.key});

  @override
  ConsumerState<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends ConsumerState<TicketPage> {
  bool isTicketSelected = true;
  final Color softWhite = const Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    final tickets = ref.watch(ticketCollectionNotifierProvider);

    Widget buildHeader() {
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(SolarIconsBold.bell,
                        color: Colors.white, size: 36.0),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                    icon: const Icon(SolarIconsOutline.hamburgerMenu,
                        color: Colors.white, size: 36.0),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                      // ._scaffoldKey
                      // .currentState
                      // ?.openEndDrawer();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isTicketSelected = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isTicketSelected
                          ? const Color(0xD99D926E)
                          : Colors.transparent,
                      side: const BorderSide(color: Color(0xFFD7B58D)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: Text(AppLocalizations.of(context)!.ticket,
                        style: TextStyle(color: softWhite, fontSize: 16)),
                  ),
                  // const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isTicketSelected = false;
                      });
                      // context.go('/upcoming');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isTicketSelected
                          ? Colors.transparent
                          : const Color(0xD99D926E),
                      side: const BorderSide(color: Color(0xFFD7B58D)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: Text(AppLocalizations.of(context)!.upcomingtickets,
                        style: TextStyle(color: softWhite, fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(),
            switch (tickets) {
              AsyncData(:final value) => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    if (isTicketSelected &&
                        whenIsTheDate(value[index].startDate).isNegative) {
                      return FurnitureCard(
                          isUpcoming: false,
                          item: value[index],
                          softWhite: softWhite);
                    } else if (!isTicketSelected &&
                        !whenIsTheDate(value[index].startDate).isNegative) {
                      return FurnitureCard(
                          isUpcoming: true,
                          item: value[index],
                          softWhite: softWhite);
                    } else {
                      return Container();
                    }
                  }),
              AsyncError() => const Text('Oops, something unexpected happened'),
              _ => const CircularProgressIndicator(),
            }
          ],
        ),
      ),
    );
  }
}

class FurnitureCard extends StatelessWidget {
  final Ticket item;
  final Color softWhite;
  final bool isUpcoming;

  const FurnitureCard(
      {super.key,
      required this.item,
      required this.softWhite,
      required this.isUpcoming});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 6.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: item.imageUrl != ""
                ? Image.network(
                    item.imageUrl,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : const Text("NO IMAGE"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
                // const SizedBox(width: 8),
                // CardIconValue(
                //     context,
                //     SolarIconsOutline.calendar,
                //     DateFormat.MMMMEEEEd(
                //             Localizations.localeOf(context).languageCode)
                //         .format(item.endDate),
                //     hasIcon: false),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardIconValue(
                context,
                SolarIconsOutline.usersGroupTwoRounded,
                '${item.participants}',
              ),
              CardIconValue(
                  context,
                  SolarIconsOutline.calendar,
                  // DateFormat.MMMMEEEEd(Localizations.localeOf(context).languageCode).format(item.endDate),
                  isUpcoming
                      ? "${item.startDate.difference(DateTime.now()).inDays.toString()} Days Left To Start"
                      : "${item.endDate.difference(DateTime.now()).inDays.toString()} Days Left To End",
                  // : DateFormat.MMMMEEEEd(
                  //         Localizations.localeOf(context).languageCode)
                  //     .format(item.endDate),
                  hasIcon: false),
            ],
          ),
          Visibility(
            visible: !isUpcoming,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  context.push(Uri(path: '/ticketnum', queryParameters: {
                    'id': item.lotteryId,
                    "participants": item.participants.toString()
                  }).toString());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                  side: const BorderSide(color: Color(0xFFD7B58D)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    // borderRadius: BorderRadius.only(
                    //   topLeft: Radius.circular(8),
                    //   topRight: Radius.circular(8),
                    //   bottomLeft: Radius.circular(20),
                    //   bottomRight: Radius.circular(20),
                    // ),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  '${AppLocalizations.of(context)!.playnow} - ${item.price} ${AppLocalizations.of(context)!.birr}',
                  style: TextStyle(color: softWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container CardIconValue(BuildContext context, IconData iconData, String label,
      {bool hasIcon = true}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: hasIcon,
            child: Icon(
              iconData,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
