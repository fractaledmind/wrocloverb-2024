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

## Step 1: Add the `activerecord-enhancedsqlite3-adapter` gem

The first, and simplest, step to improving our #SQLiteOnRails app is to add the `activerecord-enhancedsqlite3-adapter` gem to our Gemfile. This gem, well, enhances Rails' SQLite adapter. All of the changes that the gem makes are either in Rails `main`, in a point release, or in an open PR. The gem makes all of those improvements available to Rails apps on version 7.0 or higher. As of April 12, 2024, the pull requests to improve the performance of SQLite in a multi-threaded environment are still open. This gem is thus the only way to get those improvements today.

However, there is no setup needed. Literally just run:

```sh
bundle add activerecord-enhancedsqlite3-adapter
```

After installing the gem and restarting your server, you can re-run the load test and see how the results have changed. On my laptop, I got these results after only installing the gem:

```
$ hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced

Summary:
  Total:	10.0390 secs
  Slowest:	0.1635 secs
  Fastest:	0.0031 secs
  Average:	0.0292 secs
  Requests/sec:	683.0386

  Total data:	158728381 bytes
  Size/request:	23148 bytes

Response time histogram:
  0.003 [1]	|
  0.019 [2931]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.035 [1858]	|■■■■■■■■■■■■■■■■■■■■■■■■■
  0.051 [1124]	|■■■■■■■■■■■■■■■
  0.067 [503]	|■■■■■■■
  0.083 [235]	|■■■
  0.099 [120]	|■■
  0.115 [49]	|■
  0.131 [21]	|
  0.147 [12]	|
  0.163 [3]	|


Latency distribution:
  10% in 0.0085 secs
  25% in 0.0125 secs
  50% in 0.0240 secs
  75% in 0.0390 secs
  90% in 0.0581 secs
  95% in 0.0731 secs
  99% in 0.1047 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0031 secs, 0.1635 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0009 secs
  resp wait:	0.0203 secs, 0.0022 secs, 0.1457 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0029 secs

Status code distribution:
  [200]	6856 responses
  [404]	1 responses
```

As always, these results come from the run with the highest requets per second. I ran the command three times on a freshly seeded database (not resetting the database after each run, only at the beginning of the set of three runs). Across the three runs, the single slowest request took 0.1890 seconds. The average request time was 0.03026667 seconds (`[0.0305, 0.0292, 0.0311]`). The average requests per second was 660 (`[655.3554, 683.0386, 641.6073]`). There were no 500 errored responses per run. Finally, the average 90th percentile response time was 0.0596 seconds (`[0.0594, 0.0581, 0.0613]`).

These are _amazing_ improvements! Our slowest request was improved by 83&times;, average request time improved by 36&times;, requests per second improved by 40&times;, the 90th percentile response time improved by 117&times;, and we went from frequent 500 errors to _none_! These are **huge** improvements, and they were all achieved by adding a single gem to our Gemfile.

## Step 2: Configuring compile-time flags

We can improve things a bit more by configuring some of the internals of SQLite using compile-time flags. The [`sqlite3-ruby` gem](https://github.com/sparklemotion/sqlite3-ruby) allows you to set these flags for Bundler to use them via the `build.sqlite3` configuration option. Here is the command to set the flags and the flags I recommend setting:

```sh
bundle config set build.sqlite3 \
"--with-sqlite-cflags='-DSQLITE_DQS=0 -DSQLITE_THREADSAFE=0 -DSQLITE_DEFAULT_MEMSTATUS=0 -DSQLITE_DEFAULT_WAL_SYNCHRONOUS=1 -DSQLITE_LIKE_DOESNT_MATCH_BLOBS -DSQLITE_MAX_EXPR_DEPTH=0 -DSQLITE_OMIT_PROGRESS_CALLBACK -DSQLITE_OMIT_SHARED_CACHE -DSQLITE_USE_ALLOCA -DSQLITE_ENABLE_FTS5'"
```

You can dig into the details of each of these flags in the [SQLite docs](https://www.sqlite.org/compile.html#recommended_compile_time_options); I won't repeat their explanation of what each one does here.

> **Note:** If you have already run `bundle install` once before setting these compile-time flags, you will need to uninstall the version of the `sqlite3-ruby` gem that was installed before setting the flags. You can do this by running `gem uninstall sqlite3` and then choosing the version that your app is using as seen in the `Gemfile.lock` file (right now, it is `1.7.3`). After uninstalling the gem, run `bundle install` again.

Once you have compiled your specific installation of SQLite, you can confirm that the flags were set correctly by running the following command from the Rails console:

```ruby
ActiveRecord::Base.connection.raw_connection.execute 'pragma compile_options;'
```

Check to ensure that the output includes the flags you set. If it does, you are good to go!

> **Note:** Rails' default `.gitignore` will ignore any and all files in the `.bundle` directory. This means that the `config` file you set will not be checked into your repository. In order to ensure that this configuration is shared with anyone that clones and runs this repository, a new section was added to the `bin/setup` script to run the `bundle config` command automatically. This way, anyone that runs `bin/setup` will have the same configuration set up on their machine.

With this in place, we can re-run the load test to see how the results have changed. On my laptop, I got these results after setting the compile-time flags:

```
$ hey -c 20 -z 10s -m POST http://127.0.0.1:3000/benchmarking/balanced

Summary:
  Total:	10.0338 secs
  Slowest:	0.1769 secs
  Fastest:	0.0031 secs
  Average:	0.0285 secs
  Requests/sec:	699.8368

  Total data:	159483590 bytes
  Size/request:	22711 bytes

Response time histogram:
  0.003 [1]	|
  0.020 [3259]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.038 [1999]	|■■■■■■■■■■■■■■■■■■■■■■■■■
  0.055 [969]	|■■■■■■■■■■■■
  0.073 [455]	|■■■■■■
  0.090 [194]	|■■
  0.107 [91]	|■
  0.125 [30]	|
  0.142 [16]	|
  0.160 [6]	|
  0.177 [2]	|


Latency distribution:
  10% in 0.0077 secs
  25% in 0.0119 secs
  50% in 0.0230 secs
  75% in 0.0380 secs
  90% in 0.0580 secs
  95% in 0.0720 secs
  99% in 0.1015 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0000 secs, 0.0031 secs, 0.1769 secs
  DNS-lookup:	0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:	0.0000 secs, 0.0000 secs, 0.0022 secs
  resp wait:	0.0198 secs, 0.0020 secs, 0.1612 secs
  resp read:	0.0001 secs, 0.0000 secs, 0.0040 secs

Status code distribution:
  [200]	7021 responses
  [500]	1 responses
```

Again, these results come from the run with the highest requets per second. I ran the command three times on a freshly seeded database (not resetting the database after each run, only at the beginning of the set of three runs). Across the three runs, the single slowest request took 0.2044 seconds. The average request time was 0.02906667 seconds (`[0.0293, 0.0294, 0.0285]`). The average requests per second was 686.28033333 (`[681.8377, 677.1665, 699.8368]`). There were no 500 errored responses per run. Finally, the average 90th percentile response time was 0.05816667 seconds (`[0.0566, 0.0599, 0.0580]`).

So, we see slight improvements, but this is exactly what the [SQLite docs](https://www.sqlite.org/compile.html#recommended_compile_time_options) tell us to expect:

> When all of the recommended compile-time options above are used, the SQLite library will be approximately 3% smaller and use about 5% fewer CPU cycles. So these options do not make a huge difference. But in some design situations, every little bit helps.

The average request time improved 4%, the average requests per second improved 4%, and the average 90th percentile response time improved 2.5%.

You can decide for yourself whether these improvements are worth implementing compile-time flags. If you are running a high-traffic application, every little bit helps. If you are running a low-traffic application, you may not see any noticeable difference.
