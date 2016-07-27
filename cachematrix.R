##This function is going to make the cache matrix

##Two variables called x and s, x is the matrix requiring processing,
##and s is the result after inversing
makeCacheMatrix <- function(x = numeric()){
  s <- NULL
  
  set<-function(y){
    x<<-y
    s<<-NULL
  }
  get <- function() x
  setinverse<-function(solve) s<<-solve
  getinverse<-function() s
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


##This function is going to cache the inverse matrix

cacheSolve <- function(x){
  s <- x$getinverse()
  if(!is.null(s)){
    message("Getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data)
  x$setinverse(s)
  print(s)
}

