//: Playground - noun: a place where people can play

import Foundation

Watches.tick("Playground")

///Chaining action tracking

/**
    Track with default printing format
 */
Watches.create("1 million times loop").tick {
    for _ in 0...10000000 {
        
    }
}.tock()


/**
    Track with custom printing format
 */
Watches.create("2 million times loop").tick {
    for _ in 0...20000000 {
        
    }
}.tock { debugPrint("Elapse time for \($0) is \($1)")}


///Separated action tracking

let closure = {
    //Do something
    Watches.tock("Closure")
}

//Start tracking here
Watches.tick("Closure")

//Sleep for 2 second
sleep(2)

//Execute closure
closure()

//Track elapsed interval
Watches.tick("LoadProfile")

doSomething()

Watches.tock("LoadProfile") { debugPrint("Time needed for \($0) is \($1)") }


func doSomething() {
    sleep(3)
}

Watches.tock("Playground") { debugPrint("Total time needed for this playground to finished is \($1)") }
