```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0825 secs
  Slowest:	0.1785 secs
  Fastest:	0.0012 secs
  Average:	0.0165 secs
  Requests/sec:	1207.2443

  Total data:	51709128 bytes
  Size/request:	4248 bytes

Response time histogram:
  0.001 [1]	|
  0.019 [9200]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.037 [1483]	|■■■■■■
  0.054 [751]	|■■■
  0.072 [508]	|■■
  0.090 [129]	|■
  0.108 [69]	|
  0.125 [14]	|
  0.143 [12]	|
  0.161 [2]	|
  0.178 [3]	|


Latency distribution:
  10% in 0.0028 secs
  25% in 0.0048 secs
  50% in 0.0102 secs
  75% in 0.0186 secs
  90% in 0.0463 secs
  95% in 0.0567 secs
  99% in 0.0860 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0012 secs, 0.1785 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0012 secs
  resp wait:	0.0092 secs, 0.0012 secs, 0.1147 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0016 secs

Status code distribution:
  [200]	12172 responses
```