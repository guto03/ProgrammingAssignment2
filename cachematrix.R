## The two functions below are made to calculate the inversion of
## a matrix (if it's not previously calculated and cached) and to
## cache it. If it has already been cached, the functions will
## work to get the cached inverted matrix.

## This function makes a list of functions: one to set the values
## of the matrix, one to get the values of the matrix cached, one
## to set the values of the inverted matrix and another to get
## the values of the cached inverted matrix.

makeCacheMatrix <- function(x = matrix()) {
s <- NULL
set <- function(y){
  x <<- y
  s <<- NULL
}
get <- function() x
setsolve <- function(solve) s <<- solve
getsolve <- function() s
list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## This function checks if the inverted matrix was cached. If not,
## it inverts the matrix and prints it to the screen.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if(!is.null(s)){
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
