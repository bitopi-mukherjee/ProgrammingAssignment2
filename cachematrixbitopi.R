##caching an inverse of a matrix..makeCacheMatrix creates a matrix by storing a list of functions such as get, set, setinverse 
and getinverse
makeCacheMatrix<-function(x=matrix()){
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
##cacheSolve helps to calculate the inverse of the matrix that we got from the above function
cacheSolve<-function(x,...) {
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
##sample run
x=rbind(c(1,2),c(3,4))
> m=makeCacheMatrix(x)
> m$get()
     [,1] [,2]
[1,]    1    2
[2,]    3    4
> cacheSolve(m)
     [,1] [,2]
[1,] -2.0  1.0
[2,]  1.5 -0.5
