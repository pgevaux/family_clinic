view: claims {
  sql_table_name: family_clinic.claims ;;

  dimension: id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${diagnosiscode} || ${insurerid} || ${patientid} ;;
  }

  dimension: claimdate {
    hidden: yes
    type: string
    sql: ${TABLE}.claimdate ;;
  }

 dimension_group: claim_date {
  type: time
  timeframes: [date,day_of_month,day_of_week,year,day_of_year]
  sql: date(${claimdate}) ;;
 }

  dimension: diagnosiscode {
    type: number
    sql: ${TABLE}.diagnosiscode ;;
  }

  dimension: insurerid {
    type: number
    value_format_name: id
    sql: ${TABLE}.insurerid ;;
  }

  dimension: insurerorder {
    type: string
    sql: ${TABLE}.insurerorder ;;
  }

  dimension: patientid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.patientid ;;
  }

  measure: count {
    type: count
    drill_fields: [patients.last_name, patients.first_name, patients.id]
  }
}
