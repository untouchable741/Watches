//: Playground - noun: a place where people can play

import Foundation

Watches.tick(label: "Playground")

///Chaining action tracking

/**
    Track with default printing format
 */
Watches.create(label: "1 million times loop").tick {
    for _ in 0...10000000 {
        
    }
}.tock()


/**
    Track with custom printing format
 */
Watches.create(label: "2 million times loop").tick {
    for _ in 0...20000000 {
        
    }
}.tock { debugPrint("Elapse time for \($0) is \($1)")}


///Separated action tracking

let closure = {
    //Do something
    Watches.tock(label: "Closure")
}

//Start tracking here
Watches.tick(label: "Closure")

//Sleep for 2 second
sleep(2)

//Execute closure
closure()

func doSomething() {
    sleep(3)
}

//Track elapsed interval
Watches.tick(label: "LoadProfile")

doSomething()

Watches.tock(label:"LoadProfile") { debugPrint("Time needed for \($0) is \($1)") }

Watches.tock(label:"Playground") { debugPrint("Total time needed for this playground to finished is \($1)") }
