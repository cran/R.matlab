%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  
% 
% on Fri Feb 25 01:54:45 2005.
% 
% Generator was the Rdoc class, which is part of the R.oo package written
% by Henrik Bengtsson, 2001-2004.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{writeMat}
\alias{writeMat.default}
\alias{writeMat}

\title{Writes a MAT file structure}

\description{
 This function takes the given variables (\code{...}) and places them in a
 MAT file structure, which is then written to a binary connection.

 Currently only the MAT version 5 file format is supported.
}

\usage{\method{writeMat}{default}(con, ..., matVersion="5", onWrite=NULL, verbose=FALSE)}

\arguments{
  \item{con}{Binary \code{\link[base:connections]{connection}} to which the MAT file structure should be
    written to. A string is interpreted as filename, which then will be
    opened (and closed afterwards).}
  \item{...}{Named variables to be written.}
  \item{matVersion}{A \code{\link[base]{character}} string specifying what MAT file format
    version to be written to the connection. If \code{"5"}, a MAT v5 file
    structure is written. No other formats are currently supported.}
  \item{onWrite}{Function to be called just before starting to write to
    connection. Since the MAT file structure does not contain information
    about the total size of the structure this argument makes it possible
    to first write the structure size (in bytes) to the connection.}
  \item{verbose}{If \code{\link[base:logical]{TRUE}}, debug information is written to
    standard output, otherwise not.}

  Note that \code{...} must \emph{not} contain variables with names equal
  to the arguments \code{matVersion} and \code{onWrite}, which were choosen
  because we believe they are quite unique to this write method.
}

\value{
  Returns (invisibly) the number of bytes written. Any bytes written by
  any onWrite function are \emph{not} included in this count.
}

\examples{A <- matrix(1:27, ncol=3)
B <- as.matrix(1:10)

filename <- paste(tempfile(), ".mat", sep="")

writeMat(filename, A=A, B=B)
data <- readMat(filename)
print(data)

unlink(filename)


\dontrun{
# When writing to a stream connection the receiver needs to know in
# beforehand how many bytes are available. This can be done by using
# the 'onWrite' argument.
onWrite <- function(x)
  writeBin(x$length, con=x$con, size=4, endian="little");
writeMat(con, A=A, B=B, onWrite=onWrite)
}
}

\author{Henrik Bengtsson \url{http://www.braju.com/R/}}

\seealso{
  \code{\link{readMat}}().
}

\keyword{file}

\keyword{IO}

