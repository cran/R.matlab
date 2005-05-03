%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  
% 
% on Tue May 03 15:50:00 2005.
% 
% Generator was the Rdoc class, which is part of the R.oo package written
% by Henrik Bengtsson, 2001-2004.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{finalize.Matlab}
\alias{finalize.Matlab}
\alias{Matlab.finalize}
\alias{finalize.Matlab}
\alias{finalize,Matlab-method}
\keyword{methods}
\keyword{internal}


\title{Finalizes the object if deleted}

\description{
  Finalizes the object if deleted. If a Matlab connection is opened, it is closed.

  Note that you should never have to call this method explicitly. It is
  called automatically whenever the object is removed from memory
  (by the garbage collector).
}

\usage{\method{finalize}{Matlab}(this, ...)}

\arguments{
 \item{...}{Not used.}
}

\value{
  Returns nothing.
}

\author{Henrik Bengtsson \url{http://www.braju.com/R/}}

\seealso{
  For more information see \code{\link{Matlab}}.
}
