```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.1146 secs
  Slowest:	0.5741 secs
  Fastest:	0.0035 secs
  Average:	0.0378 secs
  Requests/sec:	525.1797

  Total data:	133251622 bytes
  Size/request:	25085 bytes

Response time histogram:
  0.003 [1]	|
  0.061 [4590]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.118 [625]	|■■■■■
  0.175 [69]	|■
  0.232 [13]	|
  0.289 [6]	|
  0.346 [2]	|
  0.403 [1]	|
  0.460 [2]	|
  0.517 [1]	|
  0.574 [2]	|


Latency distribution:
  10% in 0.0131 secs
  25% in 0.0190 secs
  50% in 0.0315 secs
  75% in 0.0470 secs
  90% in 0.0677 secs
  95% in 0.0838 secs
  99% in 0.1418 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0035 secs, 0.5741 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0006 secs
  resp wait:	0.0241 secs, 0.0023 secs, 0.5700 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0028 secs

Status code distribution:
  [200]	5311 responses
  [500]	1 responses
```