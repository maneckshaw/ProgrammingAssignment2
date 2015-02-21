## Programming Assignment2 cachematrix.R
## Creates a special matrix object that can cache its inverse

## This function creates a list of functions having setting matrix  and caching inverse of set matrix

makeCacheMatrix <- function(x = matrix()) {
            im <- NULL
            make <- function(y) {
                 x <<- y
                 im <- NULL
                }
            obt <- function() x
            dosolve <- function(solve) im <<- solve
            obtsolve <- function() im
            list(make=make, obt=obt, dosolve=dosolve, obtsolve=obtsolve)

}



## returns the inverse of a matrix created my makeCacheMatrix and if already found ...
## ... it returns from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
            im <- x$obtsolve()
            if(!is.null(im)){
                   message("Getting cached data")
                   return(im)
            }
           mat <- x$obt()
           im <- solve(mat)
           x$dosolve(im)
           im
           
}
