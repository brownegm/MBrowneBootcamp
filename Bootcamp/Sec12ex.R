###Section 12
#12.1

phi <- 1
for (k in 1:100) {
  phi <- 1+1/phi
  print(c(k,phi))
}

a <- 1.1
b <- 0.001
T <- seq(from=1,to=200,by=1)
N <- numeric(length(T))
n <- 2
for (t in T) {
  n <- a*n/(1+b*n)
  N[t] <- n
}

plot(T,N)

for (t in 1:length(T)) {
  n <- a*n/(1+b*n)
  N[t] <- n
}

##12.1.0.0.2 Exercise

a <- 1.1
b <- 0.001
T <- seq(0)
N <- numeric(length(T))
n <- 2
for (t in T) {
  n <- a*n/(1+b*n)
  N[t] <- n
}
print(N,T)

# When the length of T is 1 or 0 it R only produces
# a sequence that one line long because there's only one value for it to work with.

##12.2.0.0.1 Exercise

phi <- 20
conv <- FALSE
while (!conv) {
  phi.new <- 1+1/phi
  conv <- phi==phi.new
  phi <- phi.new
}
# All 100 iterations are needed for the while loop

phi <- 20
while (TRUE) {
  phi.new <- 1+1/phi
  if (phi==phi.new) break
  phi <- phi.new
}