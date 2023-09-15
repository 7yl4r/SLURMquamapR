# Check if any command line arguments were passed
if (length(commandArgs(trailingOnly = TRUE)) == 0) {
  cat("No command line arguments provided.\n")
} else {
  # Extract the first command line argument
  arg <- commandArgs(trailingOnly = TRUE)[1]
  
  # Print the value of the command line argument
  cat("Command line argument:", arg, "\n")
}
