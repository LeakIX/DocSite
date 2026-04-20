---
title: 'Authentication'
weight: 2
description: >
  How to authenticate on LeakIX's API.
---

API authentication is done by providing the `api-key` http header on your
requests.

## Generating my key

You can [find](https://leakix.net/settings/api) your API key in your profile
under `Settings > API key` :

![diy](/images/api/genkey.png)

## Python client

Install the official Python client (v1.1.0+):

```sh
pip install leakix>=1.1.0
```

## Example request

{{< tabs "auth-example" >}}

{{< tab "Curl" >}} {{< include-code "examples/api/authentication.sh" "sh" >}}
{{< /tab >}}

{{< tab "Python" >}}
{{< include-code "examples/api/authentication.py" "python" >}} {{< /tab >}}

{{< /tabs >}}
