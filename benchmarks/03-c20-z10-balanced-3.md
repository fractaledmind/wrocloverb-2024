```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0342 secs
  Slowest:	0.1474 secs
  Fastest:	0.0013 secs
  Average:	0.0150 secs
  Requests/sec:	1333.4445

  Total data:	57086236 bytes
  Size/request:	4266 bytes

Response time histogram:
  0.001 [1]	|
  0.016 [9467]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.030 [2377]	|■■■■■■■■■■
  0.045 [671]	|■■■
  0.060 [673]	|■■■
  0.074 [108]	|
  0.089 [57]	|
  0.104 [14]	|
  0.118 [9]	|
  0.133 [1]	|
  0.147 [2]	|


Latency distribution:
  10% in 0.0034 secs
  25% in 0.0060 secs
  50% in 0.0108 secs
  75% in 0.0173 secs
  90% in 0.0371 secs
  95% in 0.0476 secs
  99% in 0.0667 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0013 secs, 0.1474 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0009 secs
  resp wait:	0.0092 secs, 0.0012 secs, 0.1435 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0016 secs

Status code distribution:
  [200]	13380 responses
```