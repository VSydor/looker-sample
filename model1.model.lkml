connection: "test_postgres_data"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: company{}

explore: company_revenue_10million {

  label: "10 million revenue companies"

  view_name: company

  query: revenue>10M{
    description: "Software companies with revenue > 10M"
    dimensions: [state_s, industry, company, revenue]
    measures: []
    filters: [industry_filter: "Software"]
  }
}

explore: company_gen {
  view_name: gen
  label: "Inc 5000 Companies"

  always_filter: {
    filters: [
      industry: "Software",
      revenue: ">= 10000000"
    ]
  }
}
