```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0435 secs
  Slowest:	0.1857 secs
  Fastest:	0.0031 secs
  Average:	0.0311 secs
  Requests/sec:	641.6073

  Total data:	143294217 bytes
  Size/request:	22236 bytes

Response time histogram:
  0.003 [1]	|
  0.021 [2813]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.040 [1805]	|■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.058 [1052]	|■■■■■■■■■■■■■■■
  0.076 [455]	|■■■■■■
  0.094 [195]	|■■■
  0.113 [71]	|■
  0.131 [28]	|
  0.149 [13]	|
  0.167 [8]	|
  0.186 [3]	|


Latency distribution:
  10% in 0.0088 secs
  25% in 0.0133 secs
  50% in 0.0260 secs
  75% in 0.0423 secs
  90% in 0.0613 secs
  95% in 0.0760 secs
  99% in 0.1077 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0031 secs, 0.1857 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0012 secs
  resp wait:	0.0216 secs, 0.0022 secs, 0.1550 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0062 secs

Status code distribution:
  [200]	6442 responses
  [404]	2 responses
```