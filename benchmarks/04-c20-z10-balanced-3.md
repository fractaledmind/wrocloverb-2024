```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0354 secs
  Slowest:	0.1047 secs
  Fastest:	0.0015 secs
  Average:	0.0142 secs
  Requests/sec:	1405.2264

  Total data:	61373991 bytes
  Size/request:	4352 bytes

Response time histogram:
  0.001 [1]	|
  0.012 [7362]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.022 [4442]	|■■■■■■■■■■■■■■■■■■■■■■■■
  0.032 [955]	|■■■■■
  0.043 [912]	|■■■■■
  0.053 [297]	|■■
  0.063 [86]	|
  0.074 [33]	|
  0.084 [10]	|
  0.094 [1]	|
  0.105 [3]	|


Latency distribution:
  10% in 0.0037 secs
  25% in 0.0061 secs
  50% in 0.0113 secs
  75% in 0.0176 secs
  90% in 0.0315 secs
  95% in 0.0392 secs
  99% in 0.0525 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0015 secs, 0.1047 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0011 secs
  resp wait:	0.0086 secs, 0.0014 secs, 0.0911 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0017 secs

Status code distribution:
  [200]	14101 responses
  [404]	1 responses
```