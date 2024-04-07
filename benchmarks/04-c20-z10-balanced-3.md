```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0206 secs
  Slowest:	0.1566 secs
  Fastest:	0.0014 secs
  Average:	0.0152 secs
  Requests/sec:	1313.9912

  Total data:	55652678 bytes
  Size/request:	4226 bytes

Response time histogram:
  0.001 [1]	|
  0.017 [9089]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.032 [2684]	|■■■■■■■■■■■■
  0.048 [1034]	|■■■■■
  0.063 [280]	|■
  0.079 [57]	|
  0.095 [15]	|
  0.110 [2]	|
  0.126 [2]	|
  0.141 [1]	|
  0.157 [2]	|


Latency distribution:
  10% in 0.0036 secs
  25% in 0.0063 secs
  50% in 0.0118 secs
  75% in 0.0192 secs
  90% in 0.0336 secs
  95% in 0.0423 secs
  99% in 0.0580 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0014 secs, 0.1566 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0019 secs
  resp wait:	0.0094 secs, 0.0014 secs, 0.1294 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0032 secs

Status code distribution:
  [200]	13167 responses
```