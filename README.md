### Haskell

```shell
$ ghc -o test-hs test.hs
$ time ./test-hs
100010000
./test-hs  3.39s user 0.02s system 99% cpu 3.409 total
```

### Go

```shell
$ go build -o test-go test.go
$ time ./test-go
100010000
./test-go  1.48s user 0.19s system 197% cpu 0.843 total
```

### JavaScript

```
<--- Last few GCs --->

[12334:0xba94671b70]     1150 ms: Mark-sweep 577.1 (583.8) -> 577.1 (583.8) MB, 49.8 / 0.0 ms  allocation failure GC in old space requested
[12334:0xba94671b70]     1202 ms: Mark-sweep 577.1 (583.8) -> 577.1 (580.8) MB, 51.9 / 0.0 ms  last resort 
[12334:0xba94671b70]     1254 ms: Mark-sweep 577.1 (580.8) -> 577.1 (580.8) MB, 52.3 / 0.0 ms  last resort 


<--- JS stacktrace --->

==== JS stack trace =========================================

Security context: 0x2ae64861cef1 <JSObject>
    1: f [/home/***/test/test.js:~1] [pc=0x26845e0b6305](this=0x1fe8bb809041 <JSGlobal Object>,n=10000,l=10000)
    3: /* anonymous */ [/home/***/test/test.js:11] [bytecode=0x1e1c3cc47b51 offset=19](this=0x10fe7123aa1 <Object map = 0x6575db84829>,exports=0x10fe7123aa1 <Object map = 0x6575db84829>,require=0x10fe7123a59 <JSFunction require (sfi = 0x1e1c3cc2c999)>,module=0x10fe71239d1 <Module m...

FATAL ERROR: CALL_AND_RETRY_LAST Allocation failed - JavaScript heap out of memory
 1: node::Abort() [node]
 2: 0xba92a2653f [node]
 3: v8::Utils::ReportOOMFailure(char const*, bool) [node]
 4: v8::internal::V8::FatalProcessOutOfMemory(char const*, bool) [node]
 5: v8::internal::Factory::NewUninitializedFixedArray(int) [node]
 6: 0xba925b6410 [node]
 7: v8::internal::Runtime_GrowArrayElements(int, v8::internal::Object**, v8::internal::Isolate*) [node]
 8: 0x26845df840dd
node test.js  1.34s user 0.55s system 91% cpu 2.065 total
time node test.js
```

*Oops...* 
Let's try that again:

```shell
$ time node --max-old-space-size=4096 test.js
100010000
node --max-old-space-size=4096 test.js  1.38s user 0.20s system 100% cpu 1.583 total
```

### Python

```shell
$ time python test.py
100010000
python test.py  7.68s user 0.11s system 99% cpu 7.826 total
```
