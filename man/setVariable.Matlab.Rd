%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  
% 
% on Tue May 03 15:50:03 2005.
% 
% Generator was the Rdoc class, which is part of the R.oo package written
% by Henrik Bengtsson, 2001-2004.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{setVariable.Matlab}
\alias{setVariable.Matlab}
\alias{Matlab.setVariable}
\alias{setVariable.Matlab}
\alias{setVariable,Matlab-method}
\keyword{methods}
\keyword{internal}


\title{Sets one or several Matlab variables}

\description{
  Sets one or several \R variables on the Matlab server.
  The transfer of the data can be done locally via a temporary file
  (\code{remote=FALSE}) or through the socket \code{\link[base:connections]{connection}} (\code{remote=TRUE}),
  which is always available.
}

\usage{\method{setVariable}{Matlab}(this, ..., remote=this$remote)}

\arguments{
  \item{...}{Named \R variables to be set in Matlab.}
  \item{remote}{If \code{\link[base:logical]{TRUE}} the variables are transferred on the
    socket \code{\link[base:connections]{connection}}, otherwise they are transferred via a temporary file.}
}

\value{
  Returns nothing. If the Matlab server did not received the variables
  successfully an exception is thrown.
}

\author{Henrik Bengtsson \url{http://www.braju.com/R/}}

\seealso{
  For more information see \code{\link{Matlab}}.
}
