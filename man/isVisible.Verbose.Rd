%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  
% 
% on Fri Feb 25 01:54:42 2005.
% 
% Generator was the Rdoc class, which is part of the R.oo package written
% by Henrik Bengtsson, 2001-2004.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{isVisible.Verbose}
\alias{isVisible.Verbose}
\alias{Verbose.isVisible}
\alias{isVisible.Verbose}
\alias{isVisible,Verbose-method}
\keyword{methods}
\keyword{internal}


 \title{Checks if a certain verbose level will be shown or not}

 \description{
   Checks if a certain verbose level will be shown or not.
 }

 \usage{\method{isVisible}{Verbose}(this, level, ...)}

 \arguments{
  \item{level}{A \code{\link[base]{numeric}} value to be compared to the threshold.}
  \item{...}{Not used.}
 }

 \value{
   Returns \code{\link[base:logical]{FALSE}}, if given level is below current threshold, otherwise
   \code{\link[base:logical]{FALSE}}.
 }

 \author{Henrik Bengtsson \url{http://www.braju.com/R/}}

 \seealso{
   \code{\link[R.matlab:getThreshold.Verbose]{*getThreshold}()} and \code{\link[R.matlab:setThreshold.Verbose]{*setThreshold}()}.
   For more information see \code{\link{Verbose}}.
 }

 \keyword{programming}

