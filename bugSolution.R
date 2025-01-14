```r
# This code uses safer subsetting methods to handle potential errors when column names are not found.

data <- data.frame(A = 1:3, B = 4:6, C = 7:9)
cols_to_subset <- c("A", "D", "E")

# Solution 1: Using %in%
subsetted_data1 <- data[, cols_to_subset[cols_to_subset %in% names(data)]]

# Solution 2: Using dplyr's select function with error handling.
library(dplyr)
subsetted_data2 <- tryCatch({
  select(data, all_of(cols_to_subset))
}, error = function(e) {
  warning("Some columns not found!")
  select(data, all_of(intersect(cols_to_subset, names(data))))
})
```