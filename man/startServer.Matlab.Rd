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

\name{startServer.Matlab}
\alias{startServer.Matlab}
\alias{Matlab.startServer}
\alias{startServer.Matlab}
\alias{startServer,Matlab-method}
\keyword{methods}
\keyword{internal}


\title{Static method which starts a Matlab server}

\description{
 Static method which starts a Matlab server on the local machine. Note
 that Matlab v6 or later is required, since the Matlab server relies on
 Java.
}

\synopsis{startServer.Matlab(this, matlab=getOption("matlab"), minimize=TRUE, ...)}
\usage{Matlab$startServer(matlab=getOption("matlab"), minimize=TRUE, ...)}

\arguments{
 \item{matlab}{An optional \code{\link[base]{character}} string specifying the name of
   the matlab command, if different from \code{"matlab"}. An absolute
   path are possible.}
 \item{minimize}{When starting Matlab on Windows, it is always opened
   in a new window (see \code{\link{MatlabServer}}). If this argument is \code{\link[base:logical]{TRUE}},
   the new window is minimized, otherwise not. This argument is ignored
   on non-Windows systems.}
 \item{...}{Not used.}
}

\value{
  Returns nothing.
}

\details{
  This method is currently supported on Windows and Unix systems. Other
  systems are untested, but might work anyway.

  Note that this method will return immediately upon calling
  \code{system()} internally, i.e. you will not receive a return value
  telling wether Matlab was successfully started or not.

  To specify the full path to the matlab software set the \code{matlab}
  option, e.g. \code{options(matlab="/opt/bin/matlab6.1")}. If no such
  option exists, the value \code{"matlab"} will be used.

  The Matlab server relies on two files: 1) MatlabServer.m and
  2) InputStreamByteWrapper.class (from InputStreamByteWrapper.java).
  These files exists in the misc/ directory of this package. However,
  if they do not exist in the current directory, which is the directory
  where Matlab is started, copies of them will automatically be made.
}

\author{Henrik Bengtsson \url{http://www.braju.com/R/}}

\seealso{
  For more information see \code{\link{Matlab}}.
}
