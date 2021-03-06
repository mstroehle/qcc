\name{ewma}
\alias{ewma}
\alias{ewma.qcc}
\alias{print.ewma.qcc}
\alias{summary.ewma.qcc}
\alias{plot.ewma.qcc}

\title{EWMA chart}
\description{Create an object of class \code{'ewma.qcc'} to compute and draw an Exponential Weighted Moving Average (EWMA) chart for statistical quality control.}

\usage{
ewma(data, sizes, center, std.dev, lambda = 0.2, nsigmas = 3, 
     data.name, labels, newdata, newsizes, newlabels, 
     plot = TRUE, \dots)

\method{print}{ewma.qcc}(x, digits = getOption("digits"), \dots)

\method{plot}{ewma.qcc}(x, 
     add.stats = qcc.options("add.stats"), 
     chart.all = qcc.options("chart.all"), 
     fill = qcc.options("fill"),
     label.center = "CL",
     label.limits = c("LCL", "UCL"), 
     title, xlab, ylab, ylim, axes.las = 0,
     digits = getOption("digits"),
     restore.par = TRUE, \dots)
}

\arguments{
\item{data}{a data frame, a matrix or a vector containing observed data for the variable to chart. Each row of a data frame or a matrix, and each value of a vector, refers to a sample or ''rationale group''.}

\item{sizes}{a value or a vector of values specifying the sample sizes associated with each group. If not provided the sample sizes are obtained counting the non-\code{NA} elements of each row of a data frame or a matrix; sample sizes are set all equal to one if \code{data} is a vector.}

\item{center}{a value specifying the center of group statistics or target.}

\item{std.dev}{a value or an available method specifying the within-group standard deviation(s) of the process. \cr
Several methods are available for estimating the standard deviation. See \code{\link{sd.xbar}} and \code{\link{sd.xbar.one}} for, respectively, the grouped data case and the individual observations case.
}

\item{lambda}{the smoothing parameter \eqn{0 \le \lambda \le 1}{0 <= lambda <= 1}}

\item{nsigmas}{a numeric value specifying the number of sigmas to use for computing control limits.}

\item{data.name}{a string specifying the name of the variable which appears on the plots. If not provided is taken from the object given as data.}

\item{labels}{a character vector of labels for each group.}

\item{newdata}{a data frame, matrix or vector, as for the \code{data} argument, providing further data to plot but not included in the computations.}

\item{newsizes}{a vector as for the \code{sizes} argument providing further data sizes to plot but not included in the computations.}

\item{newlabels}{a character vector of labels for each new group defined in the argument \code{newdata}.}

\item{plot}{logical. If \code{TRUE} an EWMA chart is plotted.}

\item{add.stats}{a logical value indicating whether statistics and other information should be printed at the bottom of the chart.}

\item{chart.all}{a logical value indicating whether both statistics for \code{data} and for \code{newdata} (if given) should be plotted.}

\item{fill}{a logical value specifying if the in-control area should be filled with the color specified in 
\code{qcc.options("zones")$fill}.}

\item{label.center}{a character  specifying the label for center line.}

\item{label.limits}{a character vector specifying the labels for control limits.}

\item{title}{a string giving the label for the main title. Set \code{title = FALSE} or \code{title = NA} to remove the title.}

\item{xlab}{a string giving the label for the x-axis.}
 
\item{ylab}{a string giving the label for the y-axis.}

\item{ylim}{a numeric vector specifying the limits for the y-axis.}

\item{axes.las}{numeric in \{0,1,2,3\} specifying the style of axis labels. See \code{help(par)}.}

\item{digits}{the number of significant digits to use.}

\item{restore.par}{a logical value indicating whether the previous \code{par} settings must be restored. If you need to add points, lines, etc. to a control chart set this to \code{FALSE}.}

\item{x}{an object of class {'ewma.qcc'}.}

\item{\dots}{additional arguments to be passed to the generic function.} 
}

\details{EWMA chart smooths a series of data based on a moving average with weights which decay exponentially. Useful to detect small and permanent variation on the mean of the process.
}
\value{Returns an object of class {'ewma.qcc'}.}

\references{
Mason, R.L. and Young, J.C. (2002) \emph{Multivariate Statistical Process Control with Industrial Applications}, SIAM.

Montgomery, D.C. (2005) \emph{Introduction to Statistical Quality Control}, 5th ed. New York: John Wiley & Sons.

Ryan, T. P. (2011), \emph{Statistical Methods for Quality Improvement}, 3rd ed. New York: John Wiley & Sons, Inc.

Scrucca, L. (2004). qcc: an R package for quality control charting and statistical process control. \emph{R News} 4/1, 11-17.

Wetherill, G.B. and Brown, D.W. (1991) \emph{Statistical Process Control}. New York: Chapman & Hall.
}
\author{Luca Scrucca}
%\note{ ~~further notes~~ }
\seealso{\code{\link{qcc}}, \code{\link{ewmaSmooth}}, \code{\link{cusum}}}
\examples{
##
## Grouped-data
##
data(pistonrings)
diameter <- qccGroups(diameter, sample, data = pistonrings)

ewma(diameter[1:25,], lambda=0.2, nsigmas=3)

ewma(diameter[1:25,], lambda=0.2, nsigmas=2.7, newdata=diameter[26:40,], plot = FALSE) 

##
## Individual observations
##
data(viscosity)
with(viscosity, 
     ewma(viscosity[trial], labels = batch[trial],
          lambda = 0.2, nsigmas = 2.7,
          newdata = viscosity[!trial], newlabels = batch[!trial]))
}
\keyword{htest}
\keyword{hplot}
