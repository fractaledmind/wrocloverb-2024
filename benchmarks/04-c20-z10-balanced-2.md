```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0501 secs
  Slowest:	0.8128 secs
  Fastest:	0.0034 secs
  Average:	0.0354 secs
  Requests/sec:	563.2757

  Total data:	132230551 bytes
  Size/request:	23358 bytes

Response time histogram:
  0.003 [1]	|
  0.084 [5420]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.165 [216]	|■■
  0.246 [15]	|
  0.327 [5]	|
  0.408 [0]	|
  0.489 [0]	|
  0.570 [0]	|
  0.651 [0]	|
  0.732 [2]	|
  0.813 [2]	|


Latency distribution:
  10% in 0.0116 secs
  25% in 0.0172 secs
  50% in 0.0290 secs
  75% in 0.0444 secs
  90% in 0.0647 secs
  95% in 0.0809 secs
  99% in 0.1330 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0034 secs, 0.8128 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0008 secs
  resp wait:	0.0228 secs, 0.0022 secs, 0.7956 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0028 secs

Status code distribution:
  [200]	5661 responses
```