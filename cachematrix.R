## The below pair of functions create a matrix object and calculate the inverse. Since inverse is a costly computation
## therefore they cache the result and only computes again it the matrix is changed

## This function creates a special "matrix" along with some functions to set and get cached matrix and its inverse.

makeCacheMatrix <- function(x = matrix()) {

		inverse <- NULL

		set <- function(y) {

			x <<- y
			inverse <<- NULL			

		}

		get <- function() {

			x

		}

		setinverse <- function(inv) {

			inverse <<- inv			

		}

		getinverse <- function() {

			inverse

		}

		list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## This function calculates the inverse of a matrix, however, if it is already computed it gets it from the cache.

cacheSolve <- function(x, ...) {
        
		inv <- x$getinverse()

		if(!is.null(inv)) {

			message("Getting cached data")
			return (inv)

		}

		data <- x$get()

		inv <- solve(data, ...)

		x$setinverse(inv)

		inv

}
