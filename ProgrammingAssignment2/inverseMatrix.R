
## This function inverts the matrix 
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

## This function returns a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
  
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
