![hey](http://i.imgur.com/szzD9q0.png)


看起來本來在維護的使用者沒在維護了 我自己挑一些想要的 pr 來手動合併

[![Build Status](https://travis-ci.org/rakyll/hey.svg?branch=master)](https://travis-ci.org/rakyll/hey)

hey is a tiny program that sends some load to a web application.

hey was originally called boom and was influenced from Tarek Ziade's
tool at [tarekziade/boom](https://github.com/tarekziade/boom). Using the same name was a mistake as it resulted in cases
where binary name conflicts created confusion.
To preserve the name for its original owner, we renamed this project to hey.

## Installation

* Linux 64-bit: https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64
* Mac 64-bit: https://hey-release.s3.us-east-2.amazonaws.com/hey_darwin_amd64
* Windows 64-bit: https://hey-release.s3.us-east-2.amazonaws.com/hey_windows_amd64

### Package Managers

macOS:
-  [Homebrew](https://brew.sh/) users can use `brew install hey`.

linux:
```
$ wget https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64
$ mv hey_linux_amd64 hey 
$ chmod +x hey
$ sudo mv hey /usr/local/bin/
$ hey --help
```


## Usage

hey runs provided number of requests in the provided concurrency level and prints stats.

It also supports HTTP2 endpoints.

```
Usage: hey [options...] <url>

Options:
  -n  Number of requests to run. Default is 200.
  -c  Number of workers to run concurrently. Total number of requests cannot
      be smaller than the concurrency level. Default is 50.
  -q  Rate limit, in queries per second (QPS) per worker. Default is no rate limit.
  -z  Duration of application to send requests. When duration is reached,
      application stops and exits. If duration is specified, n is ignored.
      Examples: -z 10s -z 3m.
  -o  Output type. If none provided, a summary is printed.
      "csv" is the only supported alternative. Dumps the response
      metrics in comma-separated values format.

  -m  HTTP method, one of GET, POST, PUT, DELETE, HEAD, OPTIONS.
  -H  Custom HTTP header. You can specify as many as needed by repeating the flag.
      For example, -H "Accept: text/html" -H "Content-Type: application/xml" .
  -t  Timeout for each request in seconds. Default is 20, use 0 for infinite.
  -A  HTTP Accept header.
  -d  HTTP request body.
  -D  HTTP request body from file. For example, /home/user/file.txt or ./file.txt.
  -T  Content-type, defaults to "text/html".
  -a  Basic authentication, username:password.
  -x  HTTP Proxy address as host:port.
  -h2 Enable HTTP/2.

  -host	HTTP Host header.

  -disable-compression  Disable compression.
  -disable-keepalive    Disable keep-alive, prevents re-use of TCP
                        connections between different HTTP requests.
  -disable-redirects    Disable following of HTTP redirects
  -cpus                 Number of used cpu cores.
                        (default for current machine is 8 cores)
```

Previously known as [github.com/rakyll/boom](https://github.com/rakyll/boom).


### Dynamic request

You can create dynamic request with URI path or query params randomly generated on the fly.
Also possible to generate dynamic request body for both `-d` and `-D` flags for method that supports body.

It supports 3 basic data types: `i` for integer, `f` for float (2 decimal point) and `s` for string.
The dynamic URI/body is generated by interpolating placeholders (`typeid:min:max`) like so:

#### Dynamic URI

Use in the URL argument like so:

```sh
# dynamic path:
hey 'https://0.0.0.0:8080/{s}/{i}/{f}'

# dynamic query params:
hey 'https://0.0.0.0:8080/a/b/c?str={s1}&int={i1}&float={f1}'
```

#### Dynamic request body

Send in as the value of `-d` or a file with `-D` like so:

```json5
{
  "name": "{s:5:10}",  // string with 5 to 10 chars
  "age": {i:1:100},    // integer value between 1 to 100
  "score": {f:0:100},  // float value between 0 to 100
  "date": "{i1:1950:2023}-0{i2:1:9}-{i3:11:28}", // some date (yyyy-mm-dd)
}
```

> You can mix dynamic path, params and body all in a single request as well.

#### Placeholder

A placeholder contains of 3 segments separated by colon: `typeid:min:max`.
> `min:max` is optional with defaults `min=1`, `max=10` so only `typeid` is enough.

The `typeid` segment contains data `type` (ie `i`, `f`, `s`) and optional integer suffix `(1..N)`.

Multiple occurances of same `typeid`s eg `{i1:1:10}`, `{i1}` produce same integer between 1 and 10:
> `[{i1:1:10}, {i1:0:0}, {i1}]` => `[7, 7, 7]`

Different `typeid`s eg `i1`, `i2` etc produce different values:
> `[{i1:1:10}, {i2:1:10}, {i3:1:10}]` => `[5, 1, 9]`


The placeholder rules are same for both URI and body.




看起來本來在維護的使用者沒在維護了 我自己挑一些想要的 pr 來手動合併   也當作練習



window release

```
set GOOS=windows
set GOARCH=amd64

go build -o ./bin/hey.exe

# 如何使用 
打包完後將你bin 資料夾 放到windows path 環境變數 重開cmd  輸入hey 應該就行了



# 2023/08/13

目前已合併
1. 打請求時會有 進度條 rakyll#137
2. 直方圖如果爆掉的處理 rakyll#155
3. 增加報告最小容量 rakyll#152
4. 動態產資料   rakyll#294
5. post會因為EOF壞掉  rakyll#285
6. 弱點   rakyll#284 
7. linux install rakyll # 250


linux:
```
$ wget https://github.com/kevin811103/hey/releases/download/v0.1.5/hey_linux_amd64
$ mv hey_linux_amd64 hey 
$ chmod +x hey
$ sudo mv hey /usr/local/bin/
$ hey --help
```

arm:
```
$ wget https://github.com/kevin811103/hey/releases/download/v0.1.5/hey_linux_arm
$ mv hey_linux_amd64 hey 
$ chmod +x hey
$ sudo mv hey /usr/local/bin/
$ hey --help
```
