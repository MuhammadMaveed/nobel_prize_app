import 'package:flutter/material.dart';

class NobelDetail extends StatelessWidget {
  dynamic data;

  NobelDetail({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nobel Prize Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.amber.shade500,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 40,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            data["laureates"][0]['knownName'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.blue),
                    const SizedBox(
                      width: 5,
                    ),
                    RichText(
                        text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "Awarded Year: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "${data["awardYear"]}",
                            style: const TextStyle(
                              color: Colors.black,
                            )),
                      ],
                    )),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.category_sharp, color: Colors.blue),
                    const SizedBox(
                      width: 5,
                    ),
                    RichText(
                        text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "Category: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "${data["category"]}",
                            style: const TextStyle(
                              color: Colors.black,
                            )),
                      ],
                    )),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.category_sharp, color: Colors.blue),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                        children: [
                          const TextSpan(
                              text: "Category Full Name: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "${data["categoryFullName"]}",
                              style: const TextStyle(
                                color: Colors.black,
                              )),
                        ],
                      )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.blue),
                    const SizedBox(
                      width: 5,
                    ),
                    RichText(
                        text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "Date Awarded: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "${data["dateAwarded"]}",
                            style: const TextStyle(
                              color: Colors.black,
                            )),
                      ],
                    )),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money_outlined, color: Colors.blue),
                    const SizedBox(
                      width: 5,
                    ),
                    RichText(
                        text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "PrizeAmount: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "${data["prizeAmount"]}",
                            style: const TextStyle(
                              color: Colors.black,
                            )),
                      ],
                    )),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money_outlined, color: Colors.blue),
                    const SizedBox(
                      width: 5,
                    ),
                    RichText(
                        text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "PrizeAmountAdjusted: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "${data["prizeAmountAdjusted"]}",
                            style: const TextStyle(
                              color: Colors.black,
                            )),
                      ],
                    )),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Icon(Icons.message, color: Colors.blue),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Motivation: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                        text: "${data['laureates'][0]["motivation"]}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
