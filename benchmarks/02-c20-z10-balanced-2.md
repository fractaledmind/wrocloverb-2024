```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0588 secs
  Slowest:	0.1565 secs
  Fastest:	0.0012 secs
  Average:	0.0149 secs
  Requests/sec:	1337.7404

  Total data:	56901669 bytes
  Size/request:	4228 bytes

Response time histogram:
  0.001 [1]	|
  0.017 [10077]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.032 [1755]	|■■■■■■■
  0.048 [670]	|■■■
  0.063 [676]	|■■■
  0.079 [153]	|■
  0.094 [74]	|
  0.110 [34]	|
  0.125 [12]	|
  0.141 [1]	|
  0.157 [3]	|


Latency distribution:
  10% in 0.0026 secs
  25% in 0.0043 secs
  50% in 0.0092 secs
  75% in 0.0169 secs
  90% in 0.0424 secs
  95% in 0.0522 secs
  99% in 0.0769 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0012 secs, 0.1565 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0010 secs
  resp wait:	0.0082 secs, 0.0012 secs, 0.1136 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0017 secs

Status code distribution:
  [200]	13456 responses
```