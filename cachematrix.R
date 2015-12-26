## R Programming Assesment 2

## Function to cache a matrix in a list
##very similar to the example, just changed the names of getmean and set mean to getinverse and setinverse

makeCacheMatrix <- function(x = matrix()) 
{
    m <- NULL
    set <- function(y)
    {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## function to calculate the inverse of a matrix or using the cached value
##Just changed the mean to solve

cacheSolve <- function(x, ...) 
{
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m))
    {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
