view: customer_summary {
  derived_table:
  {
    sql:  SELECT * FROM
    `data-science-66d-demos.hsbc.customer_summary`
    QUALIFY ROW_NUMBER() OVER(PARTITION BY customer_id order by created_at desc)=1;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }
  dimension_group: summary {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.summary_date ;;
  }
  dimension: summary_text {
    type: string
    sql: ${TABLE}.summary_text ;;
  }
  measure: count {
    type: count
  }
}
