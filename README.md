# Semaphore Scripts

Utility scripts for running builds on Semaphore.

### Retry

```
Retries a command several times.

Options:
  -t, --times  - Number of times to retry the command (default: 3)
  -s, --sleep  - Number of seconds to sleep between retries (default: 0)
```

Examples:

``` bash
retry bundle install                       # retries the command 3 times
retry --times 10 bundle install            # retries the command 10 times
retry --t 5 bundle install                 # retries the command 5 times
retry --times 10 --sleep 2 bundle install  # retries the command 10 times with 2 second sleep in between

# complex commands
retry --times 5 'for i in ${1..10}; { echo "Hello World: $i" }'
```

Installation:

``` bash
curl -L https://raw.githubusercontent.com/renderedtext/scripts/master/utility/retry > /tmp/retry
chmod +x /tmp/retry
mv /tmp/retry /usr/bin/retry
```

## License

Copyright (c) 2017 Rendered Text

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
