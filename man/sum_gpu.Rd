% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reduce.R
\name{sum_gpu}
\alias{sum_gpu}
\alias{min_gpu}
\alias{max_gpu}
\alias{minmax}
\alias{sqsum}
\alias{sd_gpu}
\alias{count}
\alias{n1min}
\title{GPU Math Functions}
\usage{
sum_gpu(x, debug = FALSE)

min_gpu(x, debug = FALSE)

max_gpu(x, debug = FALSE)

minmax(x, debug = FALSE)

sqsum(x, debug = FALSE)

sd_gpu(x, debug = FALSE)

count(x, debug = FALSE)

n1min(x, debug = FALSE)
}
\arguments{
\item{x}{a numeric vector. count function takes a vector with either 1 or 2,
standing for choice 1 or choice 2.}

\item{debug}{whether to print debugging information}
}
\value{
a scalar or a pair of scalar values.
}
\description{
\code{sum}, \code{min}, \code{max}, \code{minmax} and \code{sd} conduct basic
math operations on a vector, to find summation, minimal, maximal, minimal 
and maximal at one go, and standard deviation. These functions are meant to 
operate in GPU memory. These R entry points are mainly for testing. My tests
shown in the examples sugges that the R functions in base and stats packages
are faster.
}
\details{
\code{count} is to count the numbers of responses in each response type in 
a 2AFC data set. Again, it meants to operate in GPU memory.

\code{n1min} is to find minimal value for node 1 (i.e., the first accumulator
in a 2 or more accumulator model).
}
\examples{
## The smallest vector must be greater than 512 (= 2^9) elements
dat0   <- rlba(2^20, nthread = 64); str(dat0)
result <- min_gpu(dat0$RT); result
result <- max_gpu(dat0$RT); result
result <- minmax(dat0$RT); result
result <- sum_gpu(dat0$RT); result
result <- sd_gpu(dat0$RT); result

stats::sd(dat0$RT);
base::min(dat0$RT); 
base::max(dat0$RT)
}
