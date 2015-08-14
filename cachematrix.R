## The functions below create a special type of matrix which is cached in the environment using the <<- operator. makeCacheMatrix creates such a matrix. It passes a list of the getter and setter functions to the cacheSolve function which computes the inverse if it does not exist already. 
##

## The function takes in the matrix and caches it using the <<- operator. It caches the inverse using the setinv function, getinv retrieves from cache.

makeCacheMatrix <- function(x = matrix()) {
		inv <- NULL
		set <- function(y){
		       x <<- y
		       inv <- NULL                           
                }
		get <- function() x
		setinv <- function(inverse) inv <<- inverse
		getinv <- function() inv
		list(set = set, get = get,
		     setinv = setinv,getinv = getinv)
}


## This function returns the inverse if it is precomputed, else computes and cacaches it through the setinv function. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inv <- x$getinv()
	if (!is.null(inv)){
	    message("getting cached data")
            return(m)
	}
	data <- x$get()
	inv <- solve(data)
	x$setinv(inv)
	inv
}
