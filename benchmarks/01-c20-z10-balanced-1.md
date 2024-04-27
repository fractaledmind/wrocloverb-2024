```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0236 secs
  Slowest:	0.1890 secs
  Fastest:	0.0036 secs
  Average:	0.0305 secs
  Requests/sec:	655.3554

  Total data:	161274893 bytes
  Size/request:	24550 bytes

Response time histogram:
  0.004 [1]	|
  0.022 [2934]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.041 [1980]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.059 [992]	|■■■■■■■■■■■■■■
  0.078 [431]	|■■■■■■
  0.096 [139]	|■■
  0.115 [59]	|■
  0.133 [22]	|
  0.152 [6]	|
  0.170 [4]	|
  0.189 [1]	|


Latency distribution:
  10% in 0.0092 secs
  25% in 0.0138 secs
  50% in 0.0254 secs
  75% in 0.0408 secs
  90% in 0.0594 secs
  95% in 0.0720 secs
  99% in 0.1019 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0036 secs, 0.1890 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0012 secs
  resp wait:	0.0210 secs, 0.0023 secs, 0.1355 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0038 secs

Status code distribution:
  [200]	6569 responses
```