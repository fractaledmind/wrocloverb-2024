```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	11.4200 secs
  Slowest:	5.3242 secs
  Fastest:	0.0011 secs
  Average:	0.2022 secs
  Requests/sec:	98.6863

  Total data:	2976877 bytes
  Size/request:	2641 bytes

Response time histogram:
  0.001 [1]	|
  0.533 [1086]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  1.066 [0]	|
  1.598 [0]	|
  2.130 [0]	|
  2.663 [0]	|
  3.195 [0]	|
  3.727 [0]	|
  4.260 [0]	|
  4.792 [0]	|
  5.324 [40]	|■


Latency distribution:
  10% in 0.0024 secs
  25% in 0.0045 secs
  50% in 0.0097 secs
  75% in 0.0216 secs
  90% in 0.0542 secs
  95% in 0.0933 secs
  99% in 5.2384 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0011 secs, 5.3242 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0002 secs
  resp wait:	0.1881 secs, 0.0011 secs, 5.3154 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0030 secs

Status code distribution:
  [200]	970 responses
  [500]	157 responses
```