```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0569 secs
  Slowest:	0.2755 secs
  Fastest:	0.0010 secs
  Average:	0.0170 secs
  Requests/sec:	1169.0502

  Total data:	48464900 bytes
  Size/request:	4122 bytes

Response time histogram:
  0.001 [1]	|
  0.028 [10051]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.056 [627]	|■■
  0.083 [869]	|■■■
  0.111 [143]	|■
  0.138 [52]	|
  0.166 [8]	|
  0.193 [4]	|
  0.221 [1]	|
  0.248 [0]	|
  0.276 [1]	|


Latency distribution:
  10% in 0.0027 secs
  25% in 0.0046 secs
  50% in 0.0097 secs
  75% in 0.0176 secs
  90% in 0.0531 secs
  95% in 0.0670 secs
  99% in 0.0946 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0010 secs, 0.2755 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0009 secs
  resp wait:	0.0098 secs, 0.0010 secs, 0.1773 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0096 secs

Status code distribution:
  [200]	11757 responses
```