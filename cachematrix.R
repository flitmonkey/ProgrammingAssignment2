## My first attempt at this

## The first function, makeCacheMatrix creates a 
## special "vector", which is really a list containing a 
##function to
## set the value of the Matrix
## get the value of the Matrix
## set the value of the inverse
## get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  invm <- NULL
  setmatrix <- function(y) {
    x <<- y
    invm <<- NULL
  }
  
  getmatrix <- function() x
  setinvmatrix <- function(solve) {
    invm <<- solve
  }
  
  getinvmatrix <- function() {
    invm
  }
  
  list(setmatrix = setmatrix, getmatrix = getmatrix,
       setinvmatrix = setinvmatrix,
       getinvmatrix = getinvmatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invm<-x$getinvmatrix()
  if(!is.null(invm)){
    message("getting cached data")
    return(invm)
  }
  data<-x$getmatrix()
  invm<-solve(data, ...)
  x$setinvmatrix(invm)
  invm
}
