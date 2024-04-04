```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0581 secs
  Slowest:	0.2044 secs
  Fastest:	0.0031 secs
  Average:	0.0294 secs
  Requests/sec:	677.1665

  Total data:	160995744 bytes
  Size/request:	23637 bytes

Response time histogram:
  0.003 [1]	|
  0.023 [3398]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.043 [1986]	|■■■■■■■■■■■■■■■■■■■■■■■
  0.063 [829]	|■■■■■■■■■■
  0.084 [343]	|■■■■
  0.104 [158]	|■■
  0.124 [62]	|■
  0.144 [23]	|
  0.164 [7]	|
  0.184 [3]	|
  0.204 [1]	|


Latency distribution:
  10% in 0.0081 secs
  25% in 0.0120 secs
  50% in 0.0233 secs
  75% in 0.0394 secs
  90% in 0.0599 secs
  95% in 0.0764 secs
  99% in 0.1106 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0031 secs, 0.2044 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0018 secs
  resp wait:	0.0202 secs, 0.0022 secs, 0.1463 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0033 secs

Status code distribution:
  [200]	6809 responses
  [404]	2 responses
```