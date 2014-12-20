## The next functions are used to cache potentially time-consuming computations. 
## Instead of calculating the matrix inverstion everytime the user needs it, the inverse action is 
## happening only once and then cached. 
 

## This function creates a list of functions to:
## 1. Set the value of the matrix
## 2. Get the value of the matrix
## 3. Set the value of the inverse of the matrix
## 4. Get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x 
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m 
        list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## This function checks if the inverse of the matrix is already calculated. If it's true, 
## the inverse is returned,  otherwise it calculates the inverse of the matrix and return it.

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
        
        ## Return a matrix that is the inverse of 'x'
}
