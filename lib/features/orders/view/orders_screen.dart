import 'package:flutter/material.dart';
import 'package:thimar_app/features/orders/widget/current_order/order_details_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('طلباتي', style: Theme.of(context).textTheme.labelLarge),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.grey,
                indicator: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                tabs: [
                  Tab(
                    child: Text(
                      "الحالية",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "السابقة",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Expanded(
          child: TabBarView(
            children: [
              OrderDetailsItem(status: "current"),
              OrderDetailsItem(status: "finished"),
            ],
          ),
        ),
      ),
    );
  }
}
