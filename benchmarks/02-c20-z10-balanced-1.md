```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0407 secs
  Slowest:	0.1575 secs
  Fastest:	0.0011 secs
  Average:	0.0158 secs
  Requests/sec:	1259.8773

  Total data:	54562034 bytes
  Size/request:	4313 bytes

Response time histogram:
  0.001 [1]	|
  0.017 [9116]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.032 [1846]	|■■■■■■■■
  0.048 [775]	|■■■
  0.064 [619]	|■■■
  0.079 [162]	|■
  0.095 [83]	|
  0.111 [25]	|
  0.126 [13]	|
  0.142 [5]	|
  0.158 [5]	|


Latency distribution:
  10% in 0.0028 secs
  25% in 0.0047 secs
  50% in 0.0100 secs
  75% in 0.0182 secs
  90% in 0.0428 secs
  95% in 0.0529 secs
  99% in 0.0800 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0011 secs, 0.1575 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0013 secs
  resp wait:	0.0085 secs, 0.0011 secs, 0.1510 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0018 secs

Status code distribution:
  [200]	12650 responses
```