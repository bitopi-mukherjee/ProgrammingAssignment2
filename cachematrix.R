## Put comments here that give an overall description of what your
## functions do
caching an inverse of a matrix..makeCacheMatrix creates a matrix by storing a list of functions such as get, set, setinverse 
and getinverse
## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
i<-NULL
		set<-function(y) {
		x<<-y
		i<<-NULL
	}
	get<-function()x
	setinverse<-function(inverse) i<<-inverse
	getinverse<-function()i
	list(set=set,get=get,
		setinverse=setinverse,
		getinverse=getinverse)
	}


}

## Write a short comment describing this function
cacheSolve helps to calculate the inverse of the matrix that we got from the above function
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i<-x$getinverse()
		if(!is.null(i)) {
			message("getting cached data")
			return(i)
		}
		data<-x$get()
		i<-solve(data)
		x$setinverse(i)
		i
}
