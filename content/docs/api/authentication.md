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

## Example request

### Using curl

```sh
curl -H 'api-key: JuebfishpudseimEkCeojbynMakEryok?OggIartopgolsitCimeymsyoarHubci' -H 'accept: application/json' "https://leakix.net/domain/leakix.net"
```

### HTTP request

```http request
GET /domain/leakix.net HTTP/1.1
Host: leakix.net
api-key: JuebfishpudseimEkCeojbynMakEryok?OggIartopgolsitCimeymsyoarHubci
Accept: application/json
```
