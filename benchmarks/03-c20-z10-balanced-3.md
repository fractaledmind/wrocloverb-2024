```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0521 secs
  Slowest:	0.1500 secs
  Fastest:	0.0035 secs
  Average:	0.0292 secs
  Requests/sec:	683.6368

  Total data:	156885292 bytes
  Size/request:	22829 bytes

Response time histogram:
  0.004 [1]	|
  0.018 [2570]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.033 [1770]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.047 [1455]	|■■■■■■■■■■■■■■■■■■■■■■■
  0.062 [641]	|■■■■■■■■■■
  0.077 [265]	|■■■■
  0.091 [99]	|■■
  0.106 [46]	|■
  0.121 [15]	|
  0.135 [7]	|
  0.150 [3]	|


Latency distribution:
  10% in 0.0091 secs
  25% in 0.0137 secs
  50% in 0.0250 secs
  75% in 0.0398 secs
  90% in 0.0550 secs
  95% in 0.0658 secs
  99% in 0.0924 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0035 secs, 0.1500 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0013 secs
  resp wait:	0.0211 secs, 0.0021 secs, 0.1330 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0038 secs

Status code distribution:
  [200]	6871 responses
  [404]	1 responses
```