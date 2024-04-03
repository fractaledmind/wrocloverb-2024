```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	16.1028 secs
  Slowest:	15.7031 secs
  Fastest:	0.0041 secs
  Average:	1.1525 secs
  Requests/sec:	13.1033

  Total data:	5628912 bytes
  Size/request:	26677 bytes

Response time histogram:
  0.004 [1]	|
  1.574 [183]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  3.144 [0]	|
  4.714 [0]	|
  6.284 [12]	|■■■
  7.854 [0]	|
  9.423 [0]	|
  10.993 [12]	|■■■
  12.563 [0]	|
  14.133 [0]	|
  15.703 [3]	|■


Latency distribution:
  10% in 0.0149 secs
  25% in 0.0219 secs
  50% in 0.0373 secs
  75% in 0.0690 secs
  90% in 5.2493 secs
  95% in 10.4607 secs
  99% in 15.6997 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0001 secs, 0.0041 secs, 15.7031 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0010 secs
  resp wait:	1.0217 secs, 0.0031 secs, 15.7030 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0028 secs

Status code distribution:
  [200]	177 responses
  [500]	34 responses
```