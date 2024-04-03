```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	16.2924 secs
  Slowest:	10.5007 secs
  Fastest:	0.0028 secs
  Average:	0.6316 secs
  Requests/sec:	23.5079

  Total data:	9093582 bytes
  Size/request:	23743 bytes

Response time histogram:
  0.003 [1]	|
  1.053 [342]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  2.102 [0]	|
  3.152 [0]	|
  4.202 [0]	|
  5.252 [11]	|■
  6.302 [25]	|■■■
  7.351 [0]	|
  8.401 [0]	|
  9.451 [0]	|
  10.501 [4]	|


Latency distribution:
  10% in 0.0091 secs
  25% in 0.0143 secs
  50% in 0.0264 secs
  75% in 0.0497 secs
  90% in 5.2219 secs
  95% in 5.2669 secs
  99% in 10.4778 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0028 secs, 10.5007 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0003 secs
  resp wait:	0.5302 secs, 0.0028 secs, 10.5006 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0015 secs

Status code distribution:
  [200]	320 responses
  [500]	63 responses
```