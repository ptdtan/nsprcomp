library(MASS)

set.seed(1)

# Regular PCA, with tolerance set to return three PCs
prc <- prcomp(Boston, tol = 0.35, scale. = TRUE)
prc

# Sparse cumulative PCA with three components and 15 non-zero loadings
# of the rotation matrix. The orthonormality penalty is set to a value which
# avoids co-linear principal axes. Note that for this example (as in general), 
# the non-zero loadings are not distributed uniformly over the components.
scc <- nscumcomp(Boston, ncomp = 5, k = 30, gamma = 1e11, scale. = TRUE)  
scc
t(scc$rotation)%*%scc$rotation  # quasi-orthogonality of the PAs

# Non-negative sparse cumulative PCA
nscc <- nscumcomp(Boston, ncomp = 5, nneg = TRUE, k = 30, gamma = 1e4, 
                  scale. = TRUE)  
nscc
t(nscc$rotation)%*%nscc$rotation  # quasi-orthogonality of the PAs
sum(abs(nscc$rotation) > 0 )  # k is only an upper bound

c(sum(prc$sdev), sum(scc$sdev), sum(nscc$sdev))  # cumulative variances