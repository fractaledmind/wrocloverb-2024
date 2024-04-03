```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0332 secs
  Slowest:	0.1614 secs
  Fastest:	0.0032 secs
  Average:	0.0293 secs
  Requests/sec:	681.8377

  Total data:	166301493 bytes
  Size/request:	24309 bytes

Response time histogram:
  0.003 [1]	|
  0.019 [2766]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.035 [1893]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.051 [1270]	|■■■■■■■■■■■■■■■■■■
  0.067 [521]	|■■■■■■■■
  0.082 [225]	|■■■
  0.098 [104]	|■■
  0.114 [37]	|■
  0.130 [10]	|
  0.146 [11]	|
  0.161 [3]	|


Latency distribution:
  10% in 0.0092 secs
  25% in 0.0133 secs
  50% in 0.0249 secs
  75% in 0.0394 secs
  90% in 0.0566 secs
  95% in 0.0687 secs
  99% in 0.0962 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0032 secs, 0.1614 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0014 secs
  resp wait:	0.0202 secs, 0.0023 secs, 0.1581 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0042 secs

Status code distribution:
  [200]	6840 responses
  [404]	1 responses
```