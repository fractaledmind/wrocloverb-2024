```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0378 secs
  Slowest:	0.5849 secs
  Fastest:	0.0040 secs
  Average:	0.0359 secs
  Requests/sec:	556.4938

  Total data:	128562848 bytes
  Size/request:	23015 bytes

Response time histogram:
  0.004 [1]	|
  0.062 [4974]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.120 [528]	|■■■■
  0.178 [65]	|■
  0.236 [10]	|
  0.294 [4]	|
  0.353 [0]	|
  0.411 [0]	|
  0.469 [0]	|
  0.527 [0]	|
  0.585 [4]	|


Latency distribution:
  10% in 0.0131 secs
  25% in 0.0178 secs
  50% in 0.0297 secs
  75% in 0.0438 secs
  90% in 0.0641 secs
  95% in 0.0809 secs
  99% in 0.1392 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0040 secs, 0.5849 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0013 secs
  resp wait:	0.0233 secs, 0.0024 secs, 0.5723 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0022 secs

Status code distribution:
  [200]	5585 responses
  [500]	1 responses
```