%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  
% 
% on Fri Feb 25 01:54:36 2005.
% 
% Generator was the Rdoc class, which is part of the R.oo package written
% by Henrik Bengtsson, 2001-2004.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{evaluate.Matlab}
\alias{evaluate.Matlab}
\alias{Matlab.evaluate}
\alias{evaluate.Matlab}
\alias{evaluate,Matlab-method}
\keyword{methods}
\keyword{internal}


\title{Evaluates a Matlab expression}

\description{
 Evaluates one or several Matlab expressions on the Matlab server. This
 method will not return until the Matlab server is done.

 If an error occured in Matlab an exception will be thrown. This expection
 can be caught by \code{\link[base:conditions]{tryCatch}()}.
}

\usage{\method{evaluate}{Matlab}(this, ..., collapse=";")}

\arguments{
  \item{...}{One or several string with Matlab expressions. If several
    strings are given they will be concatenated with the separator
    \code{collapse}.}
  \item{collapse}{Separator to be used to concatenate expressions.}
}

\value{
  Returns \code{0} if expressions were evaluated successfully. An exception
  might also be thrown.
}

\author{Henrik Bengtsson \url{http://www.braju.com/R/}}

\seealso{
  For more information see \code{\link{Matlab}}.
}
