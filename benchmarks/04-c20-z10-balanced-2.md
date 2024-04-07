```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0272 secs
  Slowest:	0.1281 secs
  Fastest:	0.0013 secs
  Average:	0.0159 secs
  Requests/sec:	1251.3997

  Total data:	56244165 bytes
  Size/request:	4482 bytes

Response time histogram:
  0.001 [1]	|
  0.014 [6905]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.027 [3574]	|■■■■■■■■■■■■■■■■■■■■■
  0.039 [1294]	|■■■■■■■
  0.052 [526]	|■■■
  0.065 [169]	|■
  0.077 [52]	|
  0.090 [18]	|
  0.103 [8]	|
  0.115 [0]	|
  0.128 [1]	|


Latency distribution:
  10% in 0.0032 secs
  25% in 0.0067 secs
  50% in 0.0126 secs
  75% in 0.0212 secs
  90% in 0.0337 secs
  95% in 0.0419 secs
  99% in 0.0594 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0013 secs, 0.1281 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0014 secs
  resp wait:	0.0098 secs, 0.0012 secs, 0.0912 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0020 secs

Status code distribution:
  [200]	12545 responses
  [404]	2 responses
  [500]	1 responses
```