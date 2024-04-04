```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0319 secs
  Slowest:	0.1673 secs
  Fastest:	0.0034 secs
  Average:	0.0288 secs
  Requests/sec:	692.1930

  Total data:	169920386 bytes
  Size/request:	24470 bytes

Response time histogram:
  0.003 [1]	|
  0.020 [2689]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.036 [2223]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.053 [1366]	|■■■■■■■■■■■■■■■■■■■■
  0.069 [463]	|■■■■■■■
  0.085 [145]	|■■
  0.102 [40]	|■
  0.118 [11]	|
  0.135 [5]	|
  0.151 [0]	|
  0.167 [1]	|


Latency distribution:
  10% in 0.0110 secs
  25% in 0.0154 secs
  50% in 0.0248 secs
  75% in 0.0385 secs
  90% in 0.0518 secs
  95% in 0.0622 secs
  99% in 0.0820 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0034 secs, 0.1673 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0015 secs
  resp wait:	0.0209 secs, 0.0022 secs, 0.1380 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0037 secs

Status code distribution:
  [200]	6944 responses
```