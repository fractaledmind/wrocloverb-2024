```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0390 secs
  Slowest:	0.1635 secs
  Fastest:	0.0031 secs
  Average:	0.0292 secs
  Requests/sec:	683.0386

  Total data:	158728381 bytes
  Size/request:	23148 bytes

Response time histogram:
  0.003 [1]	|
  0.019 [2931]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.035 [1858]	|■■■■■■■■■■■■■■■■■■■■■■■■■
  0.051 [1124]	|■■■■■■■■■■■■■■■
  0.067 [503]	|■■■■■■■
  0.083 [235]	|■■■
  0.099 [120]	|■■
  0.115 [49]	|■
  0.131 [21]	|
  0.147 [12]	|
  0.163 [3]	|


Latency distribution:
  10% in 0.0085 secs
  25% in 0.0125 secs
  50% in 0.0240 secs
  75% in 0.0390 secs
  90% in 0.0581 secs
  95% in 0.0731 secs
  99% in 0.1047 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0031 secs, 0.1635 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0009 secs
  resp wait:	0.0203 secs, 0.0022 secs, 0.1457 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0029 secs

Status code distribution:
  [200]	6856 responses
  [404]	1 responses
```