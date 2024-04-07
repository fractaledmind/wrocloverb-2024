```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0089 secs
  Slowest:	0.1678 secs
  Fastest:	0.0014 secs
  Average:	0.0151 secs
  Requests/sec:	1321.9271

  Total data:	66366464 bytes
  Size/request:	5015 bytes

Response time histogram:
  0.001 [1]	|
  0.018 [9121]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.035 [3166]	|■■■■■■■■■■■■■■
  0.051 [779]	|■■■
  0.068 [115]	|■
  0.085 [26]	|
  0.101 [10]	|
  0.118 [4]	|
  0.135 [0]	|
  0.151 [6]	|
  0.168 [3]	|


Latency distribution:
  10% in 0.0031 secs
  25% in 0.0062 secs
  50% in 0.0122 secs
  75% in 0.0205 secs
  90% in 0.0307 secs
  95% in 0.0384 secs
  99% in 0.0543 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0014 secs, 0.1678 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0010 secs
  resp wait:	0.0093 secs, 0.0014 secs, 0.1147 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0021 secs

Status code distribution:
  [200]	13230 responses
  [404]	1 responses
```