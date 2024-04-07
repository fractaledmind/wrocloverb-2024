```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0521 secs
  Slowest:	0.1924 secs
  Fastest:	0.0013 secs
  Average:	0.0166 secs
  Requests/sec:	1201.8375

  Total data:	50881855 bytes
  Size/request:	4211 bytes

Response time histogram:
  0.001 [1]	|
  0.020 [9616]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.040 [1121]	|■■■■■
  0.059 [479]	|■■
  0.078 [625]	|■■■
  0.097 [133]	|■
  0.116 [56]	|
  0.135 [36]	|
  0.154 [11]	|
  0.173 [2]	|
  0.192 [1]	|


Latency distribution:
  10% in 0.0027 secs
  25% in 0.0046 secs
  50% in 0.0096 secs
  75% in 0.0176 secs
  90% in 0.0510 secs
  95% in 0.0641 secs
  99% in 0.0948 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0013 secs, 0.1924 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0007 secs
  resp wait:	0.0094 secs, 0.0013 secs, 0.1924 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0030 secs

Status code distribution:
  [200]	12081 responses
```