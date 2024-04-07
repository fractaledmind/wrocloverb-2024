```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

```sh
Summary:
  Total:	10.0547 secs
  Slowest:	0.1969 secs
  Fastest:	0.0013 secs
  Average:	0.0168 secs
  Requests/sec:	1188.2960

  Total data:	51119002 bytes
  Size/request:	4278 bytes

Response time histogram:
  0.001 [1]	|
  0.021 [9493]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.040 [1092]	|■■■■■
  0.060 [648]	|■■■
  0.080 [497]	|■■
  0.099 [112]	|
  0.119 [74]	|
  0.138 [17]	|
  0.158 [8]	|
  0.177 [4]	|
  0.197 [2]	|


Latency distribution:
  10% in 0.0027 secs
  25% in 0.0046 secs
  50% in 0.0097 secs
  75% in 0.0179 secs
  90% in 0.0504 secs
  95% in 0.0626 secs
  99% in 0.0948 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0013 secs, 0.1969 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0008 secs
  resp wait:	0.0094 secs, 0.0012 secs, 0.1693 secs
  resp read:	0.0000 secs, 0.0000 secs, 0.0028 secs

Status code distribution:
  [200]	11948 responses
```