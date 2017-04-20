connection: "family_clinic"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

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

explore: patients {
  join: visits {
    relationship: one_to_many
    sql_on: ${patients.id} = ${visits.patient_id} ;;
  }

  join: claims {
    relationship: one_to_many
    sql_on: ${patients.id} = ${claims.patientid} and ${visits.diagnosis_code} = ${claims.diagnosiscode} ;;
  }

}
