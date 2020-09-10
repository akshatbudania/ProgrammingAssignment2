## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function( m = matrix() ) {
  
  ## Initialize the inverse property
  j <- NULL
  ## Method to set the matrix
  set <- function( matrix ) {
    m <<- matrix
    j <<- NULL
  }
  
  ## Method the get the matrix
  get <- function() {
     m
  }
  
  ## Method to set the inverse of the matrix
  setInverse <- function(inverse) {
    j <<- inverse
  }
  
  ## Method to get the inverse of the matrix
  getInverse <- function() {
    ## Return the inverse property
    j
  }
  
  ## Return a list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  ## Just return the inverse if its already set
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
  ## Get the matrix from our object
  data <- x$get()
  
  m <- solve(data,...) 
  
  x$setInverse(m)
  
  ## Return the matrix
  m
}