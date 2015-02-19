## My first attempt at this

## The first function, makeCacheMatrix creates a 
## special "vector", which is really a list containing a 
##function to
## set the value of the Matrix
## get the value of the Matrix
## set the value of the inverse
## get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  invm <- NULL ##nullifiy the invm object
  setmatrix <- function(y) { ## function to store matrix in x
    x <<- y
    invm <<- NULL
  }
  
  getmatrix <- function() { ##function to return the matrix
    x
  }
  
  setinvmatrix <- function(solve) {## function to set the inverse function
    invm <<- solve
  }
  
  getinvmatrix <- function() {##function to return the inverse
    invm
  }
  
  list(setmatrix = setmatrix, getmatrix = getmatrix,
       setinvmatrix = setinvmatrix,
       getinvmatrix = getinvmatrix) ## the list of functions
}


## The following function calculates the inverse 
##of the special "vector" created with the above function. 
##However, it first checks to see if the inverse has 
##already been calculated. If so, it gets the inverse 
##from the cache and skips the computation. 
##Otherwise, it calculates the inverse of the data and 
##sets the value of the inverse in the cache via the 
##setinvmatrix function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invm<-x$getinvmatrix() ##retrieve eisting inverse
  
  if(!is.null(invm)){ ##if it doesn't exist get the cached one
    message("getting cached data")
    return(invm)
  }
  
  ##if its  not cached calculate it and cache for next time
  data<-x$getmatrix() ##get the matric
  
  invm<-solve(data, ...)##find the inverse
  
  x$setinvmatrix(invm)##set the inverse
  
  invm ## return the inverse
}
