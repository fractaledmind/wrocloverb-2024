```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0339 secs
  Slowest:	0.1332 secs
  Fastest:	0.0014 secs
  Average:	0.0147 secs
  Requests/sec:	1358.3002

  Total data:	64135730 bytes
  Size/request:	4705 bytes

Response time histogram:
  0.001 [1]	|
  0.015 [8872]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.028 [3026]	|■■■■■■■■■■■■■■
  0.041 [863]	|■■■■
  0.054 [667]	|■■■
  0.067 [132]	|■
  0.080 [50]	|
  0.094 [6]	|
  0.107 [9]	|
  0.120 [1]	|
  0.133 [2]	|


Latency distribution:
  10% in 0.0039 secs
  25% in 0.0061 secs
  50% in 0.0112 secs
  75% in 0.0175 secs
  90% in 0.0350 secs
  95% in 0.0428 secs
  99% in 0.0590 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0014 secs, 0.1332 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0009 secs
  resp wait:	0.0091 secs, 0.0014 secs, 0.0964 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0032 secs

Status code distribution:
  [200]	13629 responses
```