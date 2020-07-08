## stress master

Docker wrk stress tool container with preinstalled lua. Support description request headers and list of url in the json file.

Example:

```
./stress -s http://localhost:8080 -f ./test-requests.json -c 1 -d 10 -t 1
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