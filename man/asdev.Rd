\name{asdev}
\alias{asdev}
\title{Additional Explained Standard Deviation}
\usage{
asdev(x, w, center = TRUE, scale. = FALSE)
}
\arguments{
  \item{x}{a numeric data matrix with the observations as
  rows}

  \item{w}{a numeric data matrix with the principal axes as
  columns}

  \item{center}{a logical value indicating whether the
  empirical mean of \code{x} should be subtracted.
  Alternatively, a vector of length equal to the number of
  columns of \code{x} can be supplied. The value is passed
  to \code{\link{scale}}.}

  \item{scale.}{a logical value indicating whether the
  columns of \code{x} should be scaled to have unit
  variance before the analysis takes place. The default is
  \code{FALSE} for consistency with \code{prcomp}.
  Alternatively, a vector of length equal to the number of
  columns of \code{x} can be supplied.  The value is passed
  to \code{\link{scale}}.}
}
\value{
\code{asdev} returns a list with class \code{(nsprcomp,
prcomp)} containing the following elements: \item{sdev}{the
additional standard deviation explained by each component}
\item{rotation}{copied from the input argument \code{w}}
\item{x}{the scores matrix \eqn{\mathbf{XW}}{X*W},
containing the principal components as columns (after
centering and scaling if requested)} \item{center,
scale.}{the centering and scaling used} \item{xp}{the
deflated data matrix corresponding to \code{x}} \item{q}{an
orthonormal basis for the principal subspace}
}
\description{
\code{asdev} computes the \emph{additional} standard
deviation explained by each principal component, taking
into account the possible non-orthogonality of the
pseudo-rotation matrix \eqn{\mathbf{W}}{W}.
}
\details{
The additional standard deviation of a component is
measured after projecting the corresponding principal axis
to the ortho-complement space spanned by the previous
principal axes. This procedure ensures that the variance
explained by non-orthogonal principal axes is not counted
multiple times. If the principal axes are pairwise
orthogonal (e.g. computed using standard PCA), the
additional standard deviations are identical to the
standard deviations of the columns of the scores matrix
\eqn{\mathbf{XW}}{X*W}.

\code{asdev} is also useful to build a partial PCA model
from \eqn{\mathbf{W}}{W}, to be completed with additional
components computed using \code{\link{nsprcomp}}.
}
\note{
The PCA terminology is not consistent across the
literature. Given a zero mean data matrix
\eqn{\mathbf{X}}{X} (with observations as rows) and a basis
\eqn{\mathbf{W}}{W} of the principal subspace, we define
the scores matrix as \eqn{\mathbf{Z}=\mathbf{XW}}{Z=X*W}
which contains the principal components as its columns. The
columns of the pseudo-rotation matrix \eqn{\mathbf{W}}{W}
are called the principal axes, and the elements of
\eqn{\mathbf{W}}{W} are called the loadings.
}
\references{
Mackey, L. (2009) Deflation Methods for Sparse PCA. In
\emph{Advances in Neural Information Processing Systems}
(pp. 1017--1024).
}

