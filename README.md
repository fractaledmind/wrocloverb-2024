# README

This is an app built for demonstration purposes for the [wroclove.rb conference](https://wrocloverb.com) held in Wrocław, Poland on April 12-14, 2024.

It is intended to be run locally in the `RAILS_ENV=production` environment to demonstrate the performance characteristics of a Rails application using SQLite.

## Setup

After cloning the repository, run the `bin/setup` command to install the dependencies and set up the database. It is recommended to run all commands in the `production` environments to allow you to better simulate the application locally:

```sh
RAILS_ENV=production bin/setup
```

## Details

This application runs on Ruby 3.2.1, Rails `main`, and SQLite 3.45.2 (gem version 1.7.3).

It was created using the following command:

```sh
rails new wrocloverb --main --database=sqlite3 --asset-pipeline=propshaft --javascript=esbuild --css=tailwind --skip-jbuilder --skip-action-mailbox --skip-spring
```

So it uses [`propshaft`](https://github.com/rails/propshaft) for asset compilation, [`esbuild`](https://esbuild.github.io) for JavaScript bundling, and [`tailwind`](https://tailwindcss.com) for CSS.

The application is a basic "Hacker News" style app with `User`s, `Post`s, and `Comment`s. The seeds file will create ~100 users, ~1,000 posts, and ~10 comments per post. Every user has the same password: `password`, so you can sign in as any user to test the app.

## Load Testing

Load testing can be done using the [`hey` CLI utility](https://github.com/rakyll/hey), which can be installed on MacOS via [homebrew](https://brew.sh):

```sh
brew install hey
```

or using their [precompiled binaries](https://github.com/rakyll/hey?tab=readme-ov-file#installation) on other platforms.

In order to perform the load testing, you will need to run the web server in the `production` environment. To do this from your laptop, there are a few environment variables you will need to set:

```sh
RELAX_SSL=true RAILS_LOG_LEVEL=warn SECRET_KEY_BASE=asdf RAILS_ENV=production WEB_CONCURRENCY=10 RAILS_MAX_THREADS=3 bin/rails server
```

The `RELAX_SSL` environment variable is necessary to allow you to use `http://localhost`. The `RAILS_LOG_LEVEL` is set to `warn` to reduce the amount of logging output. The `SECRET_KEY_BASE` is a dummy value that is required for the app to start. Set `WEB_CONCURRENCY` to the number of cores you have on your laptop. I am on an M1 Macbook Pro with 10 cores, and thus I set the value to 10. The `RAILS_MAX_THREADS` controls the number of threads per worker. I left it at the default of 3, but you can tweak it to see how it affects performance.

With your server running in one terminal window, you can use the load testing utility to test the app in another terminal window. Here is the shape of the command you will use to test the app:

```sh
hey -c N -z 10s -m POST http://127.0.0.1:3000/benchmarking/PATH
```

`N` is the number of concurrent requests that `hey` will make. I recommend running a large variety of different scenarios with different values of `N`. Personally, I scale up from 1 to 256 concurrent requests, doubling the number of concurrent requests each time. In general, when `N` matches your `WEB_CONCURRENCY` number, this is mostly likely the sweet spot for this app.

`PATH` can be any of the benchmarking paths defined in the app. The app has a few different paths that you can test. From the `routes.rb` file:

```ruby
namespace :benchmarking do
  post "read_heavy"
  post "write_heavy"
  post "balanced"
  post "post_create"
  post "comment_create"
  post "post_destroy"
  post "comment_destroy"
  post "post_show"
  post "posts_index"
  post "user_show"
end
```

The `read_heavy`, `write_heavy`, and `balanced` paths are designed to test the performance of the app under a mix of scenarios. Each of those paths will randomly run one of the more precise actions, with the overall distribution defined in the controller to match the name. The rest of the paths are specific actions, which you can use if you want to see how a particular action handles concurrent load.

In general, I recommend running the `balanced` path with a variety of different values of `N` to see how the app performs under a variety of different scenarios.

For load testing the app in our different configurations, we will run the `balanced` benchmark with 20 concurrent requests (twice the number of Puma workers we spin up, to ensure contention) for 10 seconds:

```sh
hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced
```

## Results

Running this load test against our app, I get the following results on my laptop:

```
$ hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced

Summary:
  Total:	16.2924 secs
  Slowest:	10.5007 secs
  Fastest:	0.0028 secs
  Average:	0.6316 secs
  Requests/sec:	23.5079

  Total data:	9093582 bytes
  Size/request:	23743 bytes

Response time histogram:
  0.003 [1]	|
  1.053 [342]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  2.102 [0]	|
  3.152 [0]	|
  4.202 [0]	|
  5.252 [11]	|■
  6.302 [25]	|■■■
  7.351 [0]	|
  8.401 [0]	|
  9.451 [0]	|
  10.501 [4]	|


Latency distribution:
  10% in 0.0091 secs
  25% in 0.0143 secs
  50% in 0.0264 secs
  75% in 0.0497 secs
  90% in 5.2219 secs
  95% in 5.2669 secs
  99% in 10.4778 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0028 secs, 10.5007 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0003 secs
  resp wait:	0.5302 secs, 0.0028 secs, 10.5006 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0015 secs

Status code distribution:
  [200]	320 responses
  [500]	63 responses
```

These results are from the run with the highest requets per second. I ran the command three times on a freshly seeded database (not resetting the database after each run, only at the beginning of the set of three runs). Across the three runs, the single slowest request took 15.7031 seconds. The average request time was 1.1122 seconds (`[1.1525, 0.6316, 1.5525]`). The average requests per second was 16.4845 (`[13.1033, 23.5079, 12.8424]`). On average, there were 40.67 errored responses per run (`[34, 63, 25]`). Finally, the average 90th percentile response time was 6,97336667 seconds (`[5.2493, 5.2219, 10.4489]`).

There are a few key details to pay attention to in the output:

1. Nearly 10% of the requests recieve an error response. Looking at the logs, you will see that all of these errors are `SQLite3::BusyException: database is locked` exceptions.
2. The slowest request took 14&times; longer than the average request. This is a sign that the app is not handling the load well.
3. Even on our high-powered laptop over localhost, our server can only support 16 requests per second. This is a very low number, and it is likely that the app will not be able to handle even a small number of users in production.
4. The p90 response time is nearly 7 seconds. This is a very high number, and it is likely that users will not be happy with the performance of the app.

The goal of our work is to improve these metrics while simultaneously adding more features to the app.