view: company {

  filter: industry_filter {
    view_label: "Industry label"
    suggest_dimension: company.industry
  }

  filter: revenue_filter {
    type: number
    sql: ${revenue} > 10000000 ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: growth {
    type: number
    sql: ${TABLE}."growth" ;;
  }
  dimension: industry {
    type: string
    sql: ${TABLE}."industry" ;;
  }
  dimension: metro {
    type: string
    sql: ${TABLE}."metro" ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}."rank" ;;
  }
  dimension: revenue {
    type: number
    sql: ${TABLE}."revenue" ;;
  }
  dimension: state_l {
    type: string
    sql: ${TABLE}."state_l" ;;
  }
  dimension: state_s {
    type: string
    sql: ${TABLE}."state_s" ;;
  }
  dimension: url {
    type: string
    sql: ${TABLE}."url" ;;
  }
  dimension: yrs_on_list {
    type: number
    sql: ${TABLE}."yrs_on_list" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
