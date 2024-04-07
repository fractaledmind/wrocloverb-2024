```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.5853 secs
  Slowest:	10.5193 secs
  Fastest:	0.0013 secs
  Average:	1.0984 secs
  Requests/sec:	18.1384

  Total data:	523416 bytes
  Size/request:	2726 bytes

Response time histogram:
  0.001 [1]	|
  1.053 [168]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  2.105 [0]	|
  3.157 [0]	|
  4.208 [0]	|
  5.260 [6]	|■
  6.312 [0]	|
  7.364 [0]	|
  8.416 [0]	|
  9.468 [0]	|
  10.519 [17]	|■■■■


Latency distribution:
  10% in 0.0024 secs
  25% in 0.0048 secs
  50% in 0.0084 secs
  75% in 0.0266 secs
  90% in 5.2058 secs
  95% in 10.4322 secs
  99% in 10.5193 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0002 secs, 0.0013 secs, 10.5193 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0003 secs
  resp wait:	1.0410 secs, 0.0012 secs, 10.5161 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0005 secs

Status code distribution:
  [200]	159 responses
  [500]	33 responses
```