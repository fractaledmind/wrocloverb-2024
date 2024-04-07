```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0415 secs
  Slowest:	0.1001 secs
  Fastest:	0.0014 secs
  Average:	0.0135 secs
  Requests/sec:	1478.8591

  Total data:	66495662 bytes
  Size/request:	4477 bytes

Response time histogram:
  0.001 [1]	|
  0.011 [7662]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.021 [4601]	|■■■■■■■■■■■■■■■■■■■■■■■■
  0.031 [1312]	|■■■■■■■
  0.041 [935]	|■■■■■
  0.051 [237]	|■
  0.061 [70]	|
  0.070 [24]	|
  0.080 [5]	|
  0.090 [2]	|
  0.100 [1]	|


Latency distribution:
  10% in 0.0034 secs
  25% in 0.0058 secs
  50% in 0.0109 secs
  75% in 0.0174 secs
  90% in 0.0289 secs
  95% in 0.0354 secs
  99% in 0.0471 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0014 secs, 0.1001 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0010 secs
  resp wait:	0.0082 secs, 0.0013 secs, 0.0720 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0023 secs

Status code distribution:
  [200]	14849 responses
  [404]	1 responses
```