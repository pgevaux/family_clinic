view: insurer {
  sql_table_name: family_clinic.insurer ;;

  dimension: details {
    hidden: yes
    type: string
    sql: ${TABLE}.details ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: cast(JSON_EXTRACT_PATH(${details}, 'id')::varchar as numeric) ;;
  }

  dimension: payout_rate {
    type: number
    sql: cast(JSON_EXTRACT_PATH(${details}, 'payout_rate')::varchar as numeric) ;;
    value_format_name: eur
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
