library(tsmp)
data("mp_toy_data", package = "tsmp")

ref_data <- mp_toy_data$data[, 1]
write.csv(ref_data, file = "ref_data.csv", row.names = FALSE)

query_data <- mp_toy_data$data[, 2]
write.csv(query_data, file = "query_data.csv", row.names = FALSE)

# self similarity
mp_self <- stomp(ref_data, window_size = 30, exclusion_zone = 1/2)

# join similarity
mp_join <- stomp(ref_data, query_data, window_size = 30, exclusion_zone = 1/2)

# put all results into a single file
# which will be used as the answers file for stomp-R-to-python challenge
df <- data.frame(
  mp_self$mp, 
  mp_self$pi, 
  mp_self$rmp, 
  mp_self$rpi, 
  mp_self$lmp, 
  mp_self$lpi,
  mp_join$mp,
  mp_join$pi
)

colnames(df) <- c(
  "mp_self_mp", 
  "mp_self_pi", 
  "mp_self_rmp", 
  "mp_self_rpi", 
  "mp_self_lmp", 
  "mp_self_lpi",
  "mp_join_mp",
  "mp_join_pi"
)

write.csv(df, file = "test_results.csv", row.names = FALSE)

