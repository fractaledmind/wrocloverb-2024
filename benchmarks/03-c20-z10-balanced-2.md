```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0298 secs
  Slowest:	0.1560 secs
  Fastest:	0.0035 secs
  Average:	0.0298 secs
  Requests/sec:	670.0009

  Total data:	155028075 bytes
  Size/request:	23069 bytes

Response time histogram:
  0.004 [1]	|
  0.019 [2505]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.034 [1883]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.049 [1315]	|■■■■■■■■■■■■■■■■■■■■■
  0.065 [590]	|■■■■■■■■■
  0.080 [269]	|■■■■
  0.095 [96]	|■■
  0.110 [41]	|■
  0.125 [14]	|
  0.141 [2]	|
  0.156 [4]	|


Latency distribution:
  10% in 0.0093 secs
  25% in 0.0141 secs
  50% in 0.0256 secs
  75% in 0.0404 secs
  90% in 0.0565 secs
  95% in 0.0677 secs
  99% in 0.0932 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0035 secs, 0.1560 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0014 secs
  resp wait:	0.0216 secs, 0.0022 secs, 0.1369 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0032 secs

Status code distribution:
  [200]	6720 responses
```