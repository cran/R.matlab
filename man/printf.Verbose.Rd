%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  
% 
% on Fri Feb 25 01:54:43 2005.
% 
% Generator was the Rdoc class, which is part of the R.oo package written
% by Henrik Bengtsson, 2001-2004.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{printf.Verbose}
\alias{printf.Verbose}
\alias{Verbose.printf}
\alias{printf.Verbose}
\alias{printf,Verbose-method}
\keyword{methods}
\keyword{internal}


 \title{Formats and prints object if above threshold}

 \description{
   Formats and prints object if above threshold.
 }

 \usage{\method{printf}{Verbose}(this, fmtstr, ..., level=0)}

 \arguments{
  \item{...}{Objects to be passed to \code{\link[base]{sprintf}}().}
  \item{level}{A \code{\link[base]{numeric}} value to be compared to the threshold.}
 }

 \value{
   Returns nothing.
 }

 \author{Henrik Bengtsson \url{http://www.braju.com/R/}}

 \seealso{
   For more information see \code{\link{Verbose}}.
 }
