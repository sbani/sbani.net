title: Simple Go call/rate limiter
date: 2015-10-18 11:52:01
categories:
  - Software
tags:
  - Go
  - Concurrency
---

I've written a call limiter (or **rate limiter**) for **GoLang**. It's a very simple limiter, that enables you to limit the calls or a function.

You can setup the Package by giving the limit of concurrent jobs and the time between the jobs. This is especially useful for calling external APIs.

## Example
Think about an API that allows you to call it only 3 times every 2 minutes.

```go
import (
    "fmt"
    "github.com/sbani/reservoir"
)

func CallApiXYZ(i int) {
    // you call the API here, but we print something here
    fmt.Println(i)
}

func main() {
    // create the limiter with 3 concurrent calls every 2 minutes
    limiter := NewReservoir(3, 2 * time.Minute)

    // Add 10 calls to the queue
    for i := 0; i < 5; i++ {
        limiter.add(printInt, i)
    }

    // Just to make you know it's non-blocking
    fmt.Println("This is printed first")

    // Because it's non blocking, we have to wait for all 5 jobs and 1 more second
    // just to make sure the request are done in that time.
    time.Sleep((5 * 2 + 1) * time.Second)
}
```

## More to come
There will be more in some time. It's a good learning project of the Go concurrency patterns for me. So I will add some more features over time.Example
Contributions are very welcome. I like to code in a team.

Links:
- [Reservoir on Github](https://github.com/sbani/reservoir)
- [Reservoir on GoDoc](https://godoc.org/github.com/sbani/reservoir)
