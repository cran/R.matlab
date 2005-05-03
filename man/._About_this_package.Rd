%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  
% 
% on Tue May 03 15:49:38 2005.
% 
% Generator was the Rdoc class, which is part of the R.oo package written
% by Henrik Bengtsson, 2001-2004.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{. About this package}
\alias{. About this package}
\keyword{documentation}

\title{About this package}

 \alias{R.matlab}

 \description{
   This package provides methods to read and write MAT
files.  It also makes it possible to communicate (evaluate
code, send and retrieve objects etc.) with Matlab v6 or higher
running locally or on a remote host.  The auxillary Java class
provides static methods to read and write Java data types.

   In brief, this package provides a one-directional interface from
   \R to Matlab, with communication taking place via a TCP/IP connection
   and with data transferred either through another connection or via
   the file system. On the Matlab side, the TCP/IP connection is handled
   by Java.

   The methods for reading and writing MAT files are stable.
   The \R to Matlab interface is less prioritized and should be
   considered a beta version.

   For package history, see \code{showHistory(R.matlab)}.
 }

 \section{Installation}{
   To install this package do\cr

   \code{install.packages(c("R.oo", "R.matlab"))}

   To get the "devel" version, use\cr

   install.packages("R.classes", contriburl="http://www.maths.lth.se/help/R")
 }

 \section{Update}{
   To update this package do\cr

   \code{update.packages()}
 }

 \section{Dependancies and other requirements}{
   This package depends on the \link[R.oo:._About_this_package]{R.oo} package.
   The \code{readMat()} and \code{writeMat()} methods do
   \eqn{not} require a Matlab installation.
   To connect to Matlab, Matlab v6 or higher is required.
   It does \emph{not} work with Matlab v5 or before.
   This is a cross-platform package implemented in pure \R.
   For confirmed Matlab versions, see \code{\link{help}}() on the "Matlab" class.
 }

 \section{To get started}{
   To get started, see:
   \enumerate{
     \item \code{\link{readMat}}() and \code{\link{writeMat}}().
     \item \code{\link{Matlab}}.
   }
 }

 \section{Miscellaneous}{
   A related initiative is \emph{RMatlab} by Duncan Temple Lang
   and Omegahat.  It provides a bi-directional interface between the
   \R and Matlab languages. For more details, see
   \url{http://www.omegahat.org/RMatlab/}.
   To call R from Matlab on Windows (only), see \emph{MATLAB R-link}
   by Robert Henson available at the Matlab Central File Exchange
   (\url{http://www.mathworks.com/matlabcentral/fileexchange/loadFile.do?objectId=5051}).
 }

 \section{How to cite this package}{
   Whenever using this package, please cite [1] as\cr

   \preformatted{@TECHREPORT{BengtssonH_2005,
  author = {Bengtsson, Henrik},
  title = {{R.matlab} - Local and remote {M}atlab connectivity in {R}},
  institution = {Mathematical Statistics, Centre for Mathematical Sciences,
                 Lund University, Sweden},
  year = {2005},
  type = {{Preprint in Mathematical Sciences (manuscript in progress)}},
  note = {[manuscript in progress]},
  url = {http://www.maths.lth.se/help/R/R.matlab/},
}}
\emph{}

 }

 \author{Henrik Bengtsson \url{http://www.braju.com/R/}}

 \section{Wishlist}{
  Here is a list of features that would be useful, but which I have
  too little time to add myself. Contributions are appreciated.
  \itemize{
    \item Add a function, say, \code{Matlab$createShortcut()} which
          creates a Windows shortcut to start the Matlab server
          by double clicking it. It should be possible to create
          it in the current directory or to the Desktop.
          Maybe it is possible to do this upon installation and
          even to a Start -> All Programs -> R menu.
    \item Update the MatlabServer.m script to allow the user to
          specify, say from the command line, the port to connect to.
          This would improve security a little bit.
    \item To improve security, update the MatlabServer.m script to
          allow the user to specify a "password" to be send upon
          connection from R in order for Matlab to accept the
          connection. This password should be possible to specify
          from the command line when start Matlab. If not given,
          no password is required.
    \item Add additional methods to the Matlab class. For instance,
          inline function in Matlab could have its own method.
    \item Wrap up common Matlab commands as methods of the Matlab
          class, e.g. \code{who(matlab)}, \code{clear(matlab)} etc.
          Can this be done automatically using "reflection", so
          that required arguments are automatically detected?
    \item Add support for reading (and writing) sparse matrices
          to be represented by the sparse matrix class defined in
          \code{SparseM} package.
    \item Add access to Matlab variables via \code{"$"} and
          \code{"$<-"}, e.g. \code{matlab$A} and
          \code{matlab$A <- 1234}. Is this wanted?
          Maybe the same for functions, e.g. \code{matlab$dice(1000)}.
          Is it possible to return multiple return values?
  }

  If you consider implement some of the above, make sure it is not
  already implemented by downloading the latest "devel" version!
 }

 \section{Acknowledgements}{
   We wish to thank the following people who contributed with valuable
   feedback, suggestions, and code:
   \itemize{
    \item Patrick Drechsler, Biocenter, University of Wuerzburg.
    \item Andy Jacobson, Atmospheric and Oceanic Sciences Program,
          Princeton University.
    \item Yichun Wei, Department of Biological Sciences,
          University of Southern California.
   }
 }

 \section{References}{
   [1] Henrik Bengtsson,
       \emph{R.matlab - Local and remote Matlab connectivity in R},
        Mathematical Statistics, Centre for Mathematical Sciences,
       Lund University, Sweden, 2005. (manuscript in progress).
 }
