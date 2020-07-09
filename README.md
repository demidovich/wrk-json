## wrk json

This is a dockerized wrk tool with a shell startup scripts and a lua script. Lua script allows you to describe testing urls and request headers in the json file.

Usage as standard wrk:

```
./wrk --help
```

Usage with the requests described in a json file:

```
./wrk-json -s http://localhost:8080 -f ./test-requests.json -c 1 -d 10 -t 1
```

test-requests.json

```
{
    "headers": {
        "X-Custom-Header-1": "test 1",
        "X-Custom-Header-2": "test 2"
    },
    "requests": [
        {
            "path": "/url1",
            "method": "GET"
        },
        {
            "path": "/url2",
            "method": "GET"
        },
        {
            "path": "/url3",
            "body": "content",
            "method": "POST"
        }
    ]
}

```
