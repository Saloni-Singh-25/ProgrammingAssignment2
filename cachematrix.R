## Put comments here that give an overall description of what your
## functions do

## To avoid repeated computation of the inverse of  matrix, we create a matrix whose inverse can be cached

## Write a short comment describing this function

## The function below creates a matrix that can be cached later while solving for its inverse

makeCacheMatrix <- function(x = matrix()) {
  matrix_inv <- NULL
  set <- function(y) {
    x <<- y
    matrix_inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) matrix_inv <<- inverse
  getinverse <- function() matrix_inv
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  
}


## Write a short comment describing this function

## The below function returns the inverse of the matrix created above

cacheSolve <- function(x, ...) {
  
  matrix_inv <- x$getinverse()
  if(!is.null(matrix_inv)) {
    message("getting cached data")
    return(matrix_inv)
  }
  data <- x$get()
  matrix_inv <- solve(data, ...)
  x$setinverse(matrix_inv)
  matrix_inv
}
