# Version 3.7.0 [2022-08-25]

## Significant changes

 * `readMat()` now preserves the dimension of cell arrays and empty
   matrices produces by MATLAB.  See below Bug Fixes for details.
 

## New Features

 * The error message from attempting to read MAT v7.3 files now
   mentions "Hierarchical Data Format (HDF5)".
   
## Documentation

 * Updated URLs that were redirected to a new location.

## Miscellaneous

 * Prepare `readMat()` for the upcoming Matrix (>= 1.4.2).

## Bug Fixes

 * `readMat()` read empty MATLAB matrices as NULL. Now it preserves
    the original data type and dimension, e.g. `matrix(integer(), nrow
    = 0, ncol = 5)`.  Thanks to Gordon Turner for the troubleshooting,
    the bug fix, and the package test solving this.

 * `readMat()` lost the dimension for MATLAB cell arrays.  Thanks to
   Brian James for the troubleshooting, the bug fix, and the package
   test solving this.


# Version 3.6.2 [2018-09-26]

## Bug Fixes

 * `Matlab$getOption()` produced "Error in base::getOption(...) : 'x'
   must be a character string" in R-devel (to become R 3.6.0).  Thank
   you Kurt Hornik for the troubleshooting and the fix.
 
## Code Refactoring

 * CLEANUP: Drop code conditional on non-supported old versions of R.

 
# Version 3.6.1 [2016-10-19]

## New Features

 * Now `readMat()` detects when MAT v7.3 files are trying to be read
   and gives an informative error explaining those are not supported
   (Issue #23).  Thanks to Thomas Beutlich (author of C library matio)
   for (non-official) pointers on how to distinguish MAT v5 from MAT
   v7.3 files.
   
 
# Version 3.6.0 [2016-07-05]

## New Features

 * `writeMat()` gained argument `fixNames = TRUE` for automatically
   replacing periods (`.`) in variable and field names with
   underscores (`_`). Thanks to Eugenio Piasini at University College
   London for suggesting this feature.

 * The `MatlabServer.m` script now outputs verbose/debug messages to
   standard error (or more precisely MATLAB file #2) (Issue #27).

 * Internal `writeCommand()` now gives an informative error if an
   unknown command is used.  Previously it silently sent a `0L`
   command to MATLAB.

## Software Quality

 * Increased test coverage to 87% (was 73%).

## Bug Fixes

 * `writeMat()` could not write logical elements.  They are now
   converted to integers as MATLAB does not have a native logical /
   boolean data type.  Previously, `writeMat()` silently ignored
   writing the data section of these logical elements resulting in a
   MAT file that could not be parsed by MATLAB (although `readMat()`
   could).  Thanks to Eugenio Piasini for reporting on this problem.
 
## Deprecated and Defunct

 * CLEANUP: Exporting only methods parts of the public API.

 
# Version 3.5.1 [2016-03-27]

## Documentation

 * Dropping reference to deprecated `utils::setInternet2()` in
   `help("Matlab")`.
 
 
# Version 3.5.0 [2016-03-05]

## New Features

 * Now `readMat()` parses (effectively skips) also objects of array
   class `mxOPAQUE_CLASS` (=17).  The official 'MAT-File Format
   R2015b' (Sept 2015) documentation does not describe this type.  The
   parsing/skipping was done by reverse engineering and clever
   guesses.  Thanks to GitHub user 'yakzan' for reporting on this type
   of MAT files.
    
## Software Quality

 * Package test coverage is 82%.

## Code Refactoring

 * CLEANUP: Internal fallback method for reading compressed MAT files
   using Omegahat`s **Rcompression** package is not needed since R
   2.10.0 and therefore dropped.

 
# Version 3.4.0 [2016-02-03]

## New Features

 * Now `readMat()` parses also functional objects of array type
   (class) 16.  Note that the official 'MAT-File Format R2015b' (Sept
   2015) documentation does not describe this type.  I had to
   implement the parser based on best guess on how the MAT file format
   works in general, so it might not work in all cases.  Thanks to
   GitHub user 'anilatx' for reporting on this type of MAT files.

 * ROBUSTNESS: Now `writeMat(pathname, ...)` writes the MAT file
   atomically by first writing to a temporary file which is renamed
   only if successful.

 * ROBUSTNESS: Now `writeMat()` asserts that a maximum of 2^31-1 bytes
   are written per variable, otherwise an informative error is thrown.
   This byte limit is set by the MAT file format definition.  Thanks
   to GitHub user 'intelinsight' for reporting on this.

## Software Quality

 * Package test coverage is 81%.
 
 
# Version 3.3.0 [2015-09-22]

## New Features

 * `evaluate()` gained argument `capture` for capturing MATLAB output
   while evaluating MATLAB expressions.  Thanks to Rohan Shah (GitHub
   user 'rohan-shah') for contributing code for this.

 * ROBUSTNESS: Now the temporary filenames generated by MATLAB also
   includes the port number in addition to a semi-random sequence
   string.  This should lower the risk for two MATLAB server using the
   same temporary filenames.

## Bug Fixes

 * `readMat()` gave an error when reading empty sparse matrices.
   Thanks to Gregory Jefferis at University of Cambridge for the bug
   report and bug fix.

## Code Refactoring

 * Explicit import of **methods** and **utils** functions.

 
# Version 3.2.0 [2015-02-24]

## New Features

 * Now `Matlab$startServer()` always overwrites any existing
   `MatlabServer.m` and `InputStreamByteWrapper.class` to make sure
   the most recent versions are always used.  Previously, existing
   files would be kept, requiring a manual removal in order to use
   more resent versions of these files.

## Bug Fixes

 * `readMat(..., sparseMatrixClass = "matrix")` did not return the
   correct results in all cases.  Added more package tests.

 * `readMat(..., sparseMatrixClass = "SparseM")` did not handle
   all-zero sparse matrices.  Added package test for this.

 * `readMat(..., sparseMatrixClass = "Matrix")` would give "Error in
   validObject(.Object) : invalid class "dgCMatrix" object: lengths of
   slots 'i' and 'x' must match", whenever trying to read an sparse
   matrix with all zeros.  Added package test for this case. Thanks to
   Abhinav Jauhri at Carnegie Mellon University for reporting on this
   and donating a test MAT file.

 * Trying to retrieve a non-existing MATLAB variable using
   `getVariable()` would crash the R-to-MATLAB communication if
   `remote = FALSE`.  Similarly, Trying to `evaluate()` a MATLAB
   expression that is invalid or by other means fails would also break
   the R-to-MATLAB bridge.  The only solution is both cases was to
   restart R and MATLAB.  Thanks to GitHub user 'badbye' (yalei) for
   the report.
 
## Software Quality

 * Package test coverage is 77%.

 
# Version 3.1.1 [2014-10-10]

## Code Refactoring

 * CRAN POLICIES/CLEANUP: Source code file
   `InputStreamByteWrapper.java` is no longer _installed_ with this
   package.  It is only the precompiled `InputStreamByteWrapper.class`
   file that is installed. Updated documentation accordingly.
 
 
# Version 3.1.0 [2014-10-09]

## Code Refactoring

 * Bumped package dependencies.

 
# Version 3.0.4 [2014-10-05]

## Bug Fixes

 * `readMat()` parsed an `mxCELL_CLASS` structure incorrectly if one
   of its names was empty.  Thanks Dieter Menne at Menne Biomed
   Consulting in Germany for reporting on this.
 
 
# Version 3.0.3 [2014-07-24]

## Documentation

 * Added section on parallel MATLAB instances to `help("Matlab")`.
 
 
# Version 3.0.2 [2014-06-22]

## New Features

 * Added argument `workdir` to `Matlab$startServer()` for setting the
   working directory of MATLAB.  Thanks to Steven Jaffe at Morgan
   Stanley for the suggestion.

 * ROBUSTNESS: Under certain circumstances the MATLAB server script
   (`MatlabServer.m`) would try to access variables that were not yet
   defined.  Thanks to Steven Jaffe at Morgan Stanley for spotting
   this.
 
 
# Version 3.0.1 [2014-05-18]

## Bug Fixes

 * Internal `uncompressZlib()` of `readMat()` opened several raw
   connections without closing them.  Added system package test.
   Thanks Thilo Klein at University of Cambridge, UK, for the report.
 
 
# Version 3.0.0 [2014-05-06]

## Significant Changes

 * `readMat()` can now read all (zlib) compressed MAT files where it
   previously gave an error message on: "INTERNAL ERROR: Failed to
   decompress data [...]  internal error -3 in memDecompress(2)".
 
 
# Version 2.4.0 [2014-04-29]

## Bug Fixes

 * When reading non-UTF-encoded strings (e.g. `miUINT32`), `readMat()`
   would drop any characters that were not in the ASCII set
   (0,32-127). This was overly conservative as it should at least have
   kept 7-bit ASCII characters (in 0-127), e.g. newline characters
   were dropped. This bug was introduced in **R.matlab** v1.2.0
   (2008-02-12) when adding support for UTF-* strings via `iconv()`.
   Now we keep all 8-bit ASCII characters, which is also what the
   MATLAB file format documentation suggests are used in
   non-UTF-encoded text matrices. Thanks to Steven Pav (San Francisco,
   CA) for reporting on this.
 
 
# Version 2.3.1 [2014-04-26]

## New Features

 * SPEEDUP: MAT5 `mxCHAR_CLASS` structures are now read slighly faster.

## Code Refactoring

 * Now package is byte-compiled by default.

 
# Version 2.3.0 [2014-02-21]

## Bug Fixes

 * Now the package runs the garbage collector if unloaded in order to
   make sure `finalize()` is called on any deleted `Matlab` objects.
 
 
# Version 2.2.4 [2014-02-17]

## Bug Fixes

 * `setOption()` for `Matlab` gave Error in UseMethod("setOption") :
   no applicable method for 'setOption' applied to an object of class
   "c('Options', 'Object')".  Added a package system test for
   this. Thanks to Griet Laenen at KU Leuven for reporting on this.
 
 
# Version 2.2.3 [2014-02-03]

## Bug Fixes

 * BACKWARD COMPATIBILITY: The inference on the type of compression
   used in the error message when uncompression failed would itself
   generate an error on R (< 3.0.0).

## Code Refactoring

 * Bumped package dependencies.
 

# Version 2.2.2 [2014-01-28]

## New Features

 * Added option `R.matlab::readMat/v4/textMatrixCollapse` controlling
   whether MAT v4 text matrixes are collapsed into strings by row
   (`"byrow"`; default), by column (`"bycolumn"`) or not at all
   (`"none"`).

 * Whenever there is an uncompress error in `readMat()`, it now tries
   to infer what type of compression the buffer has by inspecting the
   first two bytes and include the type in the error message.

## Bug Fixes

 * `readMat(..., drop = "singletonLists")` would throw an error if the
   singleton list dropped contained NULL and that NULL was assigned to
   an element of an outer list, resulting in that element being
   dropped.
 
 
# Version 2.2.1 [2014-01-28]

## New Features

 * ROBUSTNESS: Now `Matlab$startServer()` asserts that all MATLAB
   server files that are indeed successfully copied, iff missing.

 * `open()` for `Matlab` no longer generates warnings on
   "socketConnection(...)  [...] cannot be opened", which occured
   while waiting/polling for the MATLAB server to startup and respond.
 
 
# Version 2.2.0 [2014-01-21]

## Documentation

 * Updated list of MATLAB versions for which the package has been
   confirmed to work with.

## Bug Fixes

 * The `MatlabServer.m` script would incorrectly consider MATLAB v8
   and above as MATLAB v6.  Thanks to Frank Stephen at NREL for
   reporting on this and providing a patch.

## Code Refactoring

 * Bumped package dependencies.
 
 
# Version 2.1.0 [2013-11-29]

## New Features

 * Now the `R.matlab` `Package` object is also available when the
   package is only loaded (but not attached).

 * ROBUSTNESS: Added package system test asserting that `readMat()`
   can be called without attaching the package.

## Code Refactoring

 * Package now only imports **R.oo** (no longer attaches it).  Also,
   the package now imports **R.utils** (used to suggest and attach it
   when needed).  These updates make the package more "silent".

 * Dropped obsolete `autoload()`:s.

 
# Version 2.0.7 [2013-11-28]

## New Features

 * Now the 'INTERNAL ERROR' message `readMat()` throws on failed
   decompression also includes the first and last bytes of the data
   block that it tried to decompress.  This will further help
   troubleshooting.
 
 
# Version 2.0.6 [2013-09-20]

## Code Refactoring

 * ROBUSTNESS: Forgot to import `R.methodsS3::appendVarArgs()`.
 
 
# Version 2.0.5 [2013-09-16]

## Code Refactoring

 * ROBUSTNESS: Added one explicit import from the **utils** package.
 
 
# Version 2.0.4 [2013-09-11]

## New Features

 * CONSISTENCY: Added argument `drop` to `readMat()` to control how
   singleton dimensions of for instance nested lists are dropped or
   not. The defaults are now such that **R.matlab** v2.0.4 is consistent
   with **R.matlab** v1.7.1 (**R.matlab** v2.0.0-2.0.3 were not).  Thanks
   to Claudia Beleites at IPHT Jena, Germany for reporting on this.

 * Bumped package dependencies.
 
 
# Version 2.0.3 [2013-09-10]

## Bug Fixes

 * `readMat()` would produce an error when parsing an empty
   `mxCHAR_CLASS` matrix with a 0x0 dimension.  It is not clear
   whether this is a valid MAT v5 structure or not, but I`ve added a
   workaround.  Thanks Claudia Beleites at IPHT Jena, Germany for
   reporting on this.
 
 
# Version 2.0.2 [2013-07-17]

## Documentation

 * Added section of v7.3 MAT files to `help("readMat")`.
 
 
# Version 2.0.1 [2013-07-11]

## New Features

 * Now the 'INTERNAL ERROR' message that people forward to the package
   maintainer also includes the version of the **R.matlab** package.

## Documentation

 * Updated all documentation and messages to use `MATLAB` instead of
   `Matlab`.

## Code Refactoring

 * Bumped package dependencies.
 
 
# Version 2.0.0 [2013-05-25]

## Significant Changes

 * SPEEDUP: Made `readMat()` significant faster. More than 15x
   speedup(!) is observed on MAT files with many small structures.
   This was achieved by (i) dramatically decreasing the amount of
   memory allocation and garbage collection needed by the internal raw
   buffer mechanism, by (ii) dropping an internal `rm()` calls that
   was called very often, as well as by (iii) minimizing the number of
   times local functions and objects are created.

## New Features

 * Now `readMat()` also accepts a raw vector as input.

 * Now `readMat()` no longer generates warnings reporting on "In
   readBin( con = rawBufferT, what = what, size = size, n = n, signed
   = signed, : 'signed = FALSE' is only valid for integers of sizes 1
   and 2."

## Documentation

 * Restructured `help("readMat")`.  Added a section on 'Speed
   performance'.
 
 
# Version 1.7.1 [2013-05-20]

## Documentation

 * Now all Rd `\usage{}` lines are at most 90 characters long.
 
 
# Version 1.7.0 [2013-04-15]

## New Features

 * `readMat()` now support reading 64-bit integers [array type (class)
   `mxINT64_CLASS` and `mxUINT64_CLASS`] on machines/versions of R
   with `.Machine$sizeof.long >= 8` or `.Machine$sizeof.longlong >=
   8`.

 * Package utilizes new `startupMessage()` of **R.oo**.

## Code Refactoring

 * Nearly all S3 methods are now declared properly in the namespace.
 
 
# Version 1.6.4 [2013-03-08]

## Documentation

 * Updated the help usage section for all static methods.

## Code Refactoring

 * Added an `Authors@R` field to the DESCRIPTION.
 
 
# Version 1.6.3 [2013-01-17]

## Code Refactoring

 * Bumped package dependencies.
 
 
# Version 1.6.2 [2012-12-02]

## Code Refactoring

 * `R CMD check` no longer warns on global assignments.

 * Bumped up package dependencies.
 
 
# Version 1.6.1 [2012-06-30]

## Code Refactoring

 * Updated package dependencies.
 
 
# Version 1.6.0 [2012-06-07]

## Bug Fixes

 * `readMat()` could not read sparse matrices containing logical
   values, only numerics.  This was because the `logical` bit in the
   Array Flags was not utilized by `readMat()`, which in turn was
   because the file format documentation is rather vague on how to use
   that bit.  This means that `readMat()` now represents sparse
   logical matrices using logical values, except when
   `sparseMatrixClass = "SparseM"`, because **SparseM** matrices can
   only hold numeric values. Thanks to Irtisha Sinhg at Cornell
   University for reporting on this.
 
 
# Version 1.5.9 [2012-05-05]

## New Features

 * It is now possible to specify the decompression method for
   `readMat()`.
 
 * Now `readMat()` decompression error messages are more informative.
 
 
# Version 1.5.8 [2012-04-16]

## Code Refactoring

 * Package now only imports **R.methodsS3**.
 
 
# Version 1.5.7 [2012-04-13]

## Bug Fixes

 * The **Rcompression** update in v1.5.5 introduced a bug, causing the
   loading of that package to fail.
 
 
# Version 1.5.6 [2012-04-02]

## Bug Fixes

 * `readMat(..., verbose = -111)` gave an error on object `zraw` not
   being found.
 
 
# Version 1.5.5 [2012-04-01]

SOFTWARE QUALITY:

 * ROBUSTNESS: Move most of the test code that was in the examples of
   `readMat()` and `writeMat()` to formal system tests of the package,
   and made those examples simpler.

## Deprecated and Defunct

 * Removed **Rcompression** from set of "Suggests" packages, because
   since R v2.10.0 (Oct 2009) we can use `memDecompress()` of the
   **base** package instead.  However, just in case someone is still
   running older versions of R, `readMat()` does indeed still look for
   **Rcompression** as a fallback.
 
 
# Version 1.5.4 [2012-03-06]

## Code Refactoring

 * Removed all internal copies of **base** functions that have
   `.Internal()` calls.
 
 
# Version 1.5.3 [2011-12-08]

## Documentation

 * Added a section to `help(Matlab)` on how to connect through
   firewalls.  Thanks Bas de Regt at University of Adelaide for the
   suggestion.
 
 
# Version 1.5.2 [2011-11-02]

## Code Refactoring

 * Fixed an `R CMD check` NOTE that would show up in R v2.15.0 devel.
 
 
# Version 1.5.1 [2011-09-27]

## Code Refactoring

 * The version 1.5.0 that was submitted to CRAN did not include the
   adjustments for startup messages.  Thus, resubmitting this one to
   CRAN.

 * Updated dependencies on R and packages.
 
 
# Version 1.5.0 [2011-09-24]

## New Features

 * GENERALIZATION: Now `readMat()` utilizes `base::memDecompress()` to
   uncompress compressed data structures, unless running R v2.9.x or
   before, in case `Rcompression::uncompress()` is used, iff
   installed.  R v2.10.0 was released October 2009.  Thanks Stephen
   Eglen at University of Cambridge for reminding me about
   `memDecompress()`.

 * CLEANUP: Now using `packageStartupMessage()` instead of `cat()`.
 
 
# Version 1.4.0 [2011-07-25]

## Code Refactoring

 * Added a namespace to the package, which will be more or less a
   requirement in the next major release of R.

 * CLEANUP: Now all references to the **Rcompression** package is
   within the local `uncompress()` function of `readMat()`.  This
   makes the code more modular making it easier to implement
   alternatives to `Rcompression::uncompress()`.

## Documentation

 * Added an example of verbose output to `example(readMat)`.

 
# Version 1.3.7 [2011-02-01]

## Code Refactoring

 * Now using argument `imaginary` (not partial `imag`) in calls to
   `complex()`.
 
 
# Version 1.3.6 [2010-10-29]

## New Features

 * Now `writeMat()` gives an error if duplicated object names are
   used, e.g.  `writeMat(..., A = 1, B = 2, A = 3)`.

 * Now `writeMat()` gives an error, not a warning, if there are
   non-named objects.

## Bug Fixes

 * The test for non-named objects to `writeMat()` did not work
   correctly.  Thanks Claudia Beleites for the report.
 
 
# Version 1.3.5 [2010-10-28]

## New Features

 * ROBUSTNESS: Although `readMat()` can read non-named objects, in
   MATLAB it is only the `load()` function call that can read it but
   not the plain 'load' call.  Because of this, `writeMat()` will now
   give a warning if it detects non-named objects.  For instance, in
   `writeMat("foo.mat", x = a, y)` the object `a` is named (as `x`)
   whereas `y` is not.  To name the objects and avoid the warning, use
   `writeMat("foo.mat", x = a, y = y)`.  Thanks Claudia Beleites at
   University of Trieste for reporting on this.

## Documentation

 * Clarified in the help of `writeMat()` that it can only write
   'uncompressed' MAT files.

 
# Version 1.3.4 [2010-10-26]

## Documentation

 * Clarified and corrected some sentences in `help(Matlab)`.

 * Added MATLAB 7.11.0.584 (R2010b) to the list of confirmed version
   that are compatible with **R.matlab**.

## Bug Fixes

 * The `MatlabServer.m` script incorrectly referred to the
   `InputStreamByteWrapper` class as
   `java.io.InputStreamByteWrapper`. This hopefully solves previously
   reports on obtaining "??? Undefined variable "java" or class
   "java.io.InputStreamByteWrapper". Error in ==> MatlabServer at 262
   reader = java.io.InputStreamByteWrapper(4096);".  This bug was
   introduced in **R.matlab** v1.2.5 (2009-08-25). Thanks Kenvor
   Cothey at GMO LCC for the report.R.utils

R.utils
# Version 1.3.3 [2010-09-18]

## Bug Fixes

 * `readMat()` would throw an exception on "Error in dim(matrix) <-
   dimensionsArray$dim : dims [product 1] do not match the length of
   object [0]" in rare cases related to empty strings.  Not sure if
   those cases are legal, but added an ad hoc workaround for
   them. Thanks Claude Flene at University of Turku for reporting
   this.
 
 
# Version 1.3.2 [2010-08-28]

## New Features

 * Now the `MatlabServer` script reports it's version when started.

## Documentation

 * Removed some minor ambiguities in `help(Matlab)` and updated
   `example(Matlab)` with some more troubleshooting statements.

 * Added MATLAB 7.4.0 (R2007a), 7.7.0.471 (R2008b), and 7.10.0.499
   (R2010a) to the list of confirmed version that are compatible with
   **R.matlab**.  Thanks Ajay Tripathy at UC Berkeley and Marco
   Colombo at University of Edinburgh for reporting this.

## Bug Fixes

 * Now `MatlabServer.m` saves variables using the function form,
   i.e. `save()`.  This solves the problem of having single quotation
   marks in the pathname. Thanks Michael Q. Fan at NC State University
   for reporting this problem.
 
 
# Version 1.3.1 [2010-04-20]

## Documentation

 * Minor update to argument `fixNames` of `help(readMat)`. Thanks
   Stephen Eglen (University of Cambridge) for the suggestion.
 
 
# Version 1.3.0 [2010-02-03]

## New Features

 * GENERALIZATION: Now `readMat()` can read also nested `miMATRIX`
   structures.  Issue reported by Jonathan Chard at Mango Solutions,
   UK.
 
 
# Version 1.2.6 [2009-10-16]

## New Features

 * MEMORY OPTIMIZATION: For very large compressed data objects, there
   would not be enough memory to allocate the internal buffer
   resulting in an error.  Before this buffer was initiated to be 10
   times the size of the compressed data.  If that fails, now
   `readMat()` tries smaller and smaller initial buffers, before
   giving in up.  Also, it now starts with a buffer 3 (not 10) times
   the compressed size.  Thanks to Michael Sumner for the report.
 
 
# Version 1.2.5 [2009-08-25]

## Bug Fixes

 * The MATLAB server script (`MatlabServer.m`) gave the error
   "Undefined function or method `ServerSocket` for input arguments of
   type `double`.", when launching it via `Matlab$startServer()`. It
   seems like `import java.net.*`, etc.  does not work. A workaround
   is to specify the full path for all Java classes,
   e.g. `java.net.ServerSocket`.  Thanks Nicolas Stadler for the
   report.
 
 
# Version 1.2.4 [2008-10-29]

## New Features

 * If `onWrite == NULL`, then there is no longer an outer two-pass
   scan for figuring out the size of MAT structure.  However, instead
   each internal `writeDataElement()` has to do a two-pass scan in
   order to figure out the number of bytes before writing each
   element.

## Bug Fixes

 * Arrays with more than two dimension would be written as vectors.
   Thanks Minho Chae for the report.

 * From v1.2.2, `writeMat()` would generate corrupt MAT files.
   Reverted `writeMat()` back to v1.2.1 and updated as above.
 
 
# Version 1.2.3 [2008-07-20]

## Documentation

 * Updated `example(readMat)` so that it gives no error if the
   optional **Rcompression** package is not installed.
 
 
# Version 1.2.2 [2008-07-12]

## New Features

 * Now the first pass in `writeMat()` that counts the number of bytes
   to be written is skipped if argument `onWrite` is not given.  This
   means that writing to file, which is the most common use case, will
   no longer involve the counting.  Thank to Adam Grossman at Stanford
   University for suggesting the modification and providing initial
   code.  He reports a substantial speedup in writing large files
   (38 MB file).

## Code Refactoring

 * Removed internal debugging/asserting code.

 * Renamed the HISTORY file to NEWS.
 
 
# Version 1.2.1 [2008-05-08]

## Bug Fixes

 * In `readMat()`/`writeMat()` we use an internal character vector to
   represent the 8-bit ASCII character set.  However, in R one cannot
   represent ASCII 0x00 - it resolves to an empty string, and from R
   v2.8.0 we will get a warning if we try.  For now, we have replaced
   the ASCII for 0x00 with the empty string (unless before R v2.6.0).
   We might want to move away from using this ASCII vector for
   `intToChar()`/`charToInt()` and instead make use of
   `intToUtf8()`/`utf8ToInt()` or alternatively just
   `rawToChar()`/`charToRaw()`.
 
 
# Version 1.2.0 [2008-02-12]

## New Features

 * Added support for reading compressed MAT files.  It requires that the
   **Rcompression** package (Omegahat.org) is available.

 * Added support for also returning sparse matrices according to the
   representations given by either the **Matrix** or the **SparseM**
   package.

 * Added simple UTF-* string support.  Conversion should be accurate
   when the R installation supports iconv.

 * Added `mat-files/StructWithSparseMatrix-v4.mat` from JR.

 * Credits for all of the above new feature goes to Jason Riedy at the
   Computer Science Dept, UC Berkeley.  Thanks also to Duncan
   Temple-Lang at UC Davis for the **Rcompression** package.
 
 
# Version 1.1.4 [2007-04-19]

## New Features

 * Added a "hint" to error message "Tag type not supported:
   miCOMPRESSED" to clarify that `readMat()` does not support
   compressed MAT files.
 
 
# Version 1.1.3 [2007-04-07]

## Code Refactoring

 * Update so that package passes `R CMD check` on R v2.5.0.

 * Replaced `Sys.putenv()` with new `Sys.setenv()` (to be deprecated
   in R v2.5.0).


# Version 1.1.3 [2006-12-28]

## New Features

 * Now `open()` throws an error if connection to MATLAB failed (before
   FALSE was returned).

 * Extended the accepted range of ports to [1023,66535].

## Documentation

 * Added more details on available options in `setOption()` and how to
   avoid timeouts.

 * The example in `help(Matlab)` is now using default values for
   `host` and `port` making the example less confusing.
 
 
# Version 1.1.2 [2006-05-08]

## Bug Fixes

 * When the port for the MATLAB server (`MATLABSERVER_PORT`) was out
   of range, a MATLAB syntax error occurred, i.e '... Line: 109
   Column: 45 ")" expected, "identifier" found.'  Thanks Alexander
   Nervedi for the report.
 
 
# Version 1.1.1 [2006-01-21]

## New Features

 * Added argument `port` to `Matlab$startServer(..., port = NULL)` to
   start the MATLAB server such that it listens to another port than
   the default 9999.  Internally the server first tries to obtain the
   port number by environment variable `MATLABSERVER_PORT`. This
   feature was requested by Wang Yu at Iowa State University.

## Documentation

 * Another version has been added to the list of MATLAB versions that
   are confirmed to work with **R.matlab**. See `?Matlab`.
 
 
# Version 1.1.0 [2005-06-29]

## Code Refactoring

 * If using the `Matlab` class, the package requires the **R.utils**
   where the classes `Java` and `Verbose` was moved. The methods for
   dealing with user options in the `Matlab` class are provided by the
   `Options` class also in **R.utils**. Similarly, if `verbose !=
   FALSE` in `readMat()` or `writeMat()`, then the **R.utils** package
   is required.

## Bug Fixes

 * Forgot to "implement" `miSINGLE`, i.e. to set `knownTypes` and
   `knownWhats` for this. Thanks to Craig Aumann for the report.

 * `readMat()` did not read 'complex' matrices in MAT v5 correctly.
   Thanks to Chris Sims for the report.

 * `readMat()` did not read 'text' matrices in MAT v4 correctly.
   Thanks to Chris Sims, Princeton University, for the patch.
 
 
# Version 1.0.3 [2005-05-26]

## New Features

 * Added support for user-defined options to `Matlab` objects via
   methods `setOption()` and `getOption()`. Current supported options
   are `"readResult/maxTries"` and `"readResult/interval"` to provide
   a "workaround" for the problem with timeout errors in `evaluate()`.
   Thanks Thomas Romary, France, for (re-)reporting on this problem.

 * Added class `Options`. This will probably move to another package
   whenever it becomes stable and widely used.
 
 
# Version 1.0.2 [2005-05-03]

## New Features

 * Now MATLAB struct`s are read into an R structure.

## Code Refactoring

 * Replaces package directory `misc/` with two new directories
   `mat-files/` and `externals/`.

## Bug Fixes

 * Reading empty struct:s (and cells) tried to read one field because
   `seq(0)` and not `seq(length = 0)` was used. Updated all
   occurrences of this problem.
 
 
# Version 1.0.1 [2005-04-08]

## Documentation

 * Minor additions to help pages.

## Bug Fixes

 * `readMat()` failed to read some MATLAB struct`s because of a
   parsing error.

 * Internally in `readMat()` - in `readMat5DataStructure()` it might
   be data `readTag()` returns a tag referring to a data block of zero
   length (`nbrOfBytes == 0`). Now `list(NULL)` is returned in this
   case.

 * The `MatlabServer` script did (indeed) not work with MATLAB v7; a
   wrong version was included.  Thanks Patrick Drechsler, University
   of Wuerzburg for reporting the above two problems.
 
 
# Version 1.0 [2005-02-25]

SIGNFICANT CHANGES:

 * Moved to CRAN.
 
 
# Version 0.94 [2005-02-24]

## New Features

 * Updated the `MatlabServer.m` script to automatically set the Java
   classpath for MATLAB v7 and higher. This will assure that
   `InputStreamByteWrapper.class` is found as long as it is in the
   same directory as the `*.m` script. Thanks Yichun Wei at University
   of Southern California for suggesting this and also for suggesting
   additional help instructions.

## Documentation

 * Added a Wishlist and an Acknowledgements section to "about".

 * Added more information on how to start the MATLAB server.
 
 
# Version 0.93 [2005-02-20]

## Documentation

 * Updated the Matlab example to be more explicit about problems with
   `Matlab$startServer()` and MATLAB v7.

## Code Refactoring

 * Added `autoload("hasVarArgs")` to `R/000.R`.
 
 
# Version 0.92 [2005-02-17]

## Code Refactoring

 * Package now passes `R CMD check` on R v2.1.0 devel without warnings.

 * Added `appendVarArgs = TRUE` to `setMethodS3()`, which specifies
   that `...` should be added, if missing.

 * Add argument `...` to all methods to make it even more consistent
   with any generic function. This is also done for a few methods in R
   **base** packages.

## Bug Fixes

 * `readMat()` would not read non-signed bytes correctly.
 
 
# Version 0.91 [2005-02-11]

DOCMENTATION:

 * Updated description of package. Preparing for moving to CRAN.

 * Added Rdoc comments to internal Verbose classes.
 
## Code Refactoring

 * Package passes `R CMD check` on R v2.1.0 devel too.

 * Moved the `Java` class from **R.io** to this package, since it is
   currently only used here. It is used for reading and writing Java
   bytes, ints and (UTF) strings when communicating with MATLAB.

 
# Version 0.8 [2004-02-24]

## New Features

 * Added a `setVerbose()` method to the `Matlab` class, which allows
   the user to get details at various levels of the MATLAB process.

 * Added support for reading sparse matrices. Sparse matrices are expanded to
   regular matrices, which means that some may be too large to be loaded.

## Bug Fixes

 * WORKAROUND: It sometimes happens that the reply from MATLAB is not
   transferred "quick enough" and even if the connection should block
   we receive NULL giving an error. The workaround for now is to try
   to read the answer again. The symptom was that an error in
   `readResult()` complain about "if (answer == 0)" where answer was
   of length 0.

 * The header of MAT v4 files was not parsed correctly, which made MAT
   v4 files unrecognized and assumed to be MAT v5 files which in turn
   could not be read.

 * Used `"sparce"` instead of `"sparse"` in `MOPT[4]` tag (MAT v4),
   which most likely would generate an error for such structure.
 
 
# Version 0.7 [2003-12-02]

## Bug Fixes

 * Introduced a bug that made files written with big endian not to
   work. The reason was that `<-` was used instead of `<<-` in one new
   method. I do not like `<<-`, but that is how it works.
 
 
# Version 0.6 [2003-11-25]

## New Features

 * Created an `readMat()` that can read both MAT v4 and MAT v5
   files. The MAT v4 reader was kindly provided by Andy Jacobson at
   the Princeton University.

 * `writeMat()` was created for consistency, but it does only support
   MAT v5.

 * Note that I have now chosen to rename `readMAT()` and `writeMAT()`
   to `readMat()` and `writeMat()`, respectively. This is in line with
   the RCC, cf. `readHtml()` instead of `readHTML()`. If you really
   need `readMAT()` and `writeMAT()` you can easily write your own
   wrappers.
 
 
# Version 0.5 [2003-04-04]

## Code Refactoring

 * I forgot to remove some debug code that outputs information about the
   Description comment every time a MAT file is read. Removed.
 
 
# Version 0.4 [2003-01-16]

## Code Refactoring

 * Now `require(R.io)` is loaded with the package and not when the
   first MATLAB client/server method is called. The former approach
   was a bit annoying.

## Bug Fixes

 * The MATLAB client/server implementation was broken due to bugs
   introduced in the `Java` class of the **R.io** package. Correcting
   these bugs made the MATLAB part work again.
 
 
# Version 0.3 [2002-11-11]

## Documentation

 * Made all methods use `\keyword{internal}`.

## Bug Fixes

 * `readMAT()` would not work because `getBits()` previously in
   package **R.oo** was removed. `getBits()` is now added as a local
   function inside `readMAT()`.
 
 
# Version 0.2 [2002-10-23]

## Code Refactoring

 * Upgraded to make use of Rx.oo.
 
 
# Version 0.1 [2002-09-03]

## New Features

 * Initial methods are `readMAT()` and `writeMAT()` for reading and
   writing MATLAB MAT file structures.

 * Initial class is Matlab, which provides static methods for communicating
   with the running MATLAB server.

 * Package created.