view: gen {
  sql_table_name: public.company ;; # Replace with your actual table name

  dimension: company {
    type: string
    description: "Company name"
    sql: ${TABLE}.company ;;
  }

  dimension: industry {
    type: string
    description: "Industry classification"
    sql: ${TABLE}.industry ;;
  }

  dimension: state_s {
    type: string
    description: "State name"
    map_layer_name: us_states # This enables state-level mapping
    sql: ${TABLE}.state_s ;;
  }

  dimension: revenue {
    type: number
    description: "Company revenue"
    sql: ${TABLE}.revenue ;;
  }

  # Measures
  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
    value_format_name: decimal_0
    filters: {
      field: revenue
      value: ">= 10000000" # Implementing the revenue filter from Tableau
    }
  }

  # Default filters to match Tableau view
  dimension: is_software_industry {
    type: yesno
    sql: ${industry} = 'Software' ;;
  }

}
