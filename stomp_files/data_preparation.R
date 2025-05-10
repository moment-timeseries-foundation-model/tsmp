library(tsmp)
data("mp_toy_data", package = "tsmp")

ref_data <- mp_toy_data$data[, 1]
write.csv(ref_data, file = "ref_data.csv", row.names = FALSE)

query_data <- mp_toy_data$data[, 2]
write.csv(query_data, file = "query_data.csv", row.names = FALSE)

# self similarity
mp_self <- stomp(ref_data, window_size = 30)

for (name in names(mp_self)) {
  value <- mp_self[[name]]
  
  # Save only if it's an array
  if (is.array(value) && !is.null(value)) {
    filename <- paste0("mp_self_", name, ".csv")
    write.csv(value, file = filename, row.names = FALSE)
  }
}

# join similarity
mp_join <- stomp(ref_data, query_data, window_size = 30)

for (name in names(mp_join)) {
  value <- mp_join[[name]]
  
  # Save only if it's an array
  if (is.array(value) && !is.null(value)) {
    filename <- paste0("mp_join_", name, ".csv")
    write.csv(value, file = filename, row.names = FALSE)
  }
}