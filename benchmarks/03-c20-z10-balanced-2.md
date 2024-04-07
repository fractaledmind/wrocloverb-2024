```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0437 secs
  Slowest:	0.1551 secs
  Fastest:	0.0014 secs
  Average:	0.0147 secs
  Requests/sec:	1357.3623

  Total data:	61187452 bytes
  Size/request:	4488 bytes

Response time histogram:
  0.001 [1]	|
  0.017 [9799]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.032 [2411]	|■■■■■■■■■■
  0.048 [883]	|■■■■
  0.063 [419]	|■■
  0.078 [73]	|
  0.094 [33]	|
  0.109 [8]	|
  0.124 [3]	|
  0.140 [1]	|
  0.155 [2]	|


Latency distribution:
  10% in 0.0032 secs
  25% in 0.0060 secs
  50% in 0.0108 secs
  75% in 0.0179 secs
  90% in 0.0340 secs
  95% in 0.0450 secs
  99% in 0.0617 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0014 secs, 0.1551 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0026 secs
  resp wait:	0.0090 secs, 0.0014 secs, 0.1008 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0018 secs

Status code distribution:
  [200]	13633 responses
```