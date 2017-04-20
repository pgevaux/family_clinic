view: insurer {
  sql_table_name: family_clinic.insurer ;;

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
