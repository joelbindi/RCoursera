## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inver <- NULL
  set <- function(z) {
    x <<- z
    inver <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inver <<- inverse 
  getInverse <- function() inver
  list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inver <- NULL
  if(!is.null(inver)) {
    message("getting the cached data")
    return(inver)
  }
  data <- x$get()
  inver <- solve(data)
  x$setInverse(inver)
  inver
}
