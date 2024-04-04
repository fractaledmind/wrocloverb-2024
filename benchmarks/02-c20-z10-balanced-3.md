```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0338 secs
  Slowest:	0.1769 secs
  Fastest:	0.0031 secs
  Average:	0.0285 secs
  Requests/sec:	699.8368

  Total data:	159483590 bytes
  Size/request:	22711 bytes

Response time histogram:
  0.003 [1]	|
  0.020 [3259]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.038 [1999]	|■■■■■■■■■■■■■■■■■■■■■■■■■
  0.055 [969]	|■■■■■■■■■■■■
  0.073 [455]	|■■■■■■
  0.090 [194]	|■■
  0.107 [91]	|■
  0.125 [30]	|
  0.142 [16]	|
  0.160 [6]	|
  0.177 [2]	|


Latency distribution:
  10% in 0.0077 secs
  25% in 0.0119 secs
  50% in 0.0230 secs
  75% in 0.0380 secs
  90% in 0.0580 secs
  95% in 0.0720 secs
  99% in 0.1015 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0031 secs, 0.1769 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0022 secs
  resp wait:	0.0198 secs, 0.0020 secs, 0.1612 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0040 secs

Status code distribution:
  [200]	7021 responses
  [500]	1 responses
```