%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  
% 
% on Tue May 03 15:50:13 2005.
% 
% Generator was the Rdoc class, which is part of the R.oo package written
% by Henrik Bengtsson, 2001-2004.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{ruler.Verbose}
\alias{ruler.Verbose}
\alias{Verbose.ruler}
\alias{ruler.Verbose}
\alias{ruler,Verbose-method}
\keyword{methods}
\keyword{internal}


 \title{Prints a ruler if above threshold}

 \description{
   Prints a ruler if above threshold.
 }

 \usage{\method{ruler}{Verbose}(this, chars="- ", width=getOption("width") - 1, level=0, ...)}

 \arguments{
  \item{chars}{A \code{\link[base]{character}} string concatenated to a ruler.}
  \item{width}{An \code{\link[base]{numeric}} specifying the width (in characters) of
    the ruler.}
  \item{level}{A \code{\link[base]{numeric}} value to be compared to the threshold.}
  \item{...}{Not used.}
 }

 \value{
   Returns nothing.
 }

 \author{Henrik Bengtsson \url{http://www.braju.com/R/}}

 \seealso{
   For more information see \code{\link{Verbose}}.
 }
