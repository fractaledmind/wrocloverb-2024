```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0216 secs
  Slowest:	0.1824 secs
  Fastest:	0.0014 secs
  Average:	0.0144 secs
  Requests/sec:	1388.0008

  Total data:	70358672 bytes
  Size/request:	5058 bytes

Response time histogram:
  0.001 [1]	|
  0.020 [10452]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.038 [2870]	|■■■■■■■■■■■
  0.056 [518]	|■■
  0.074 [47]	|
  0.092 [9]	|
  0.110 [8]	|
  0.128 [1]	|
  0.146 [2]	|
  0.164 [1]	|
  0.182 [1]	|


Latency distribution:
  10% in 0.0031 secs
  25% in 0.0060 secs
  50% in 0.0116 secs
  75% in 0.0195 secs
  90% in 0.0297 secs
  95% in 0.0366 secs
  99% in 0.0491 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0014 secs, 0.1824 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0009 secs
  resp wait:	0.0087 secs, 0.0014 secs, 0.1173 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0018 secs

Status code distribution:
  [200]	13906 responses
  [404]	2 responses
  [500]	2 responses
```