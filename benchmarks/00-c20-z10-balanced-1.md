```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	16.5273 secs
  Slowest:	10.4514 secs
  Fastest:	0.0014 secs
  Average:	0.2884 secs
  Requests/sec:	53.9109

  Total data:	2845635 bytes
  Size/request:	3193 bytes

Response time histogram:
  0.001 [1]	|
  1.046 [850]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  2.091 [0]	|
  3.136 [0]	|
  4.181 [0]	|
  5.226 [15]	|■
  6.271 [19]	|■
  7.316 [0]	|
  8.361 [0]	|
  9.406 [0]	|
  10.451 [6]	|


Latency distribution:
  10% in 0.0034 secs
  25% in 0.0061 secs
  50% in 0.0120 secs
  75% in 0.0237 secs
  90% in 0.0640 secs
  95% in 0.1419 secs
  99% in 5.3336 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0014 secs, 10.4514 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0006 secs
  resp wait:	0.2364 secs, 0.0014 secs, 10.4513 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0043 secs

Status code distribution:
  [200]	774 responses
  [500]	117 responses
```