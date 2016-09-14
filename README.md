# Watches
A simple stopwatches use to logging out the elapsed time between 2 timestamp. Easily find out the execution time of any function, closure, async callback.

## Installation
### Cocoapods
Coming soon
### Manual
Coming soon

## Usage
Track elapsed time of any async callback (e.g : network request)
call tick to tickoff the time with specific identifier right before calling async task
```swift
Watches.tick("LoadProfile")
```
Then call tock with the corresponding identifier inside async callback closure
```swift
Watches.tock("LoadProfile") { debugPrint("Time needed for \($0) is \($1)") } 
```
For example with Alamofire
```swift
Watches.tick("LoadProfile")
Alamofire.request(loadProfileUrl).responseJSON { response in
    Watches.tock("LoadProfile")
}
```
Result: ```Elapsed interval for LoadProfile is 1.20113898515701```

Determine the execution time of any block of code (closure).
```swift
Watches.create("First 1 million times loop").tick {
    for _ in 0...10000000 { }
}.tock()
```
Result: ```Elapsed interval for First 1 million times loop is 0.214788019657135```

If you want custom print format, just need to provide the tock callback closure.
```swift
Watches.create("2 million times loop").tick {
    for _ in 0...20000000 { }
}.tock { debugPrint("Time for finishing \($0) is \($1)")}
```
Result: ```Time for finishing 2 million times loop is 0.411646008491516```

## License
Watches is released under the MIT License. See LICENSE file for more detail. Copyright © Vuong Huu Tai
