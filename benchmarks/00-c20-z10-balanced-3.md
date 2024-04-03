```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.6678 secs
  Slowest:	10.5092 secs
  Fastest:	0.0032 secs
  Average:	1.5525 secs
  Requests/sec:	12.8424

  Total data:	2834787 bytes
  Size/request:	20691 bytes

Response time histogram:
  0.003 [1]	|
  1.054 [114]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  2.104 [0]	|
  3.155 [0]	|
  4.206 [0]	|
  5.256 [4]	|■
  6.307 [0]	|
  7.357 [0]	|
  8.408 [0]	|
  9.459 [0]	|
  10.509 [18]	|■■■■■■


Latency distribution:
  10% in 0.0108 secs
  25% in 0.0167 secs
  50% in 0.0319 secs
  75% in 0.0517 secs
  90% in 10.4489 secs
  95% in 10.4766 secs
  99% in 10.5092 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0001 secs, 0.0032 secs, 10.5092 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0001 secs
  resp wait:	1.3560 secs, 0.0025 secs, 10.5091 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0011 secs

Status code distribution:
  [200]	112 responses
  [500]	25 responses
```