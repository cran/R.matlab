path <- system.file("misc", package="R.matlab")

for (version in 4:5) {
  cat("Loading all MAT v", version, " example files in ", 
                                                path, "...\n", sep="")

  pattern <- sprintf("-v%d.mat$", version)
  filenames <- list.files(pattern=pattern, path=path, full.names=TRUE)

  for (filename in filenames) {
    cat("Reading MAT file: ", basename(filename), "\n", sep="")
    mat <- readMat(filename)
    if (interactive()) {
      cat("Press ENTER to view data:")
      readline()
    }
    print(mat)
  }
}


# Verify that sparse matrices are read the same way in MAT v4 and MAT v5
mat4 <- readMat(file.path(path, "SparseMatrix3-v4.mat"))
mat5 <- readMat(file.path(path, "SparseMatrix3-v5.mat"))
diff <- sum(abs(mat4$sparseM - mat5$sparseM))
if (diff > .Machine$double.eps)
  stop("Failed to read identical MAT v4 and MAT v5 sparse matrices.")

# Assert that signed and unsigned integer sare read correctly
bs <- readMat(file.path(path, "unsignedByte.mat"))
if (!identical(as.vector(bs$A), as.double(126:255)))
  stop("Error reading unsigned bytes saved by Matlab.")

is <- readMat(file.path(path, "unsignedInt.mat"))
if (!identical(as.vector(is$B), as.double(127:256)))
  stop("Error reading unsigned ints saved by Matlab.")
