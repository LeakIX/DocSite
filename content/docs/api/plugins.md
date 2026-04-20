---
title: 'Plugins'
weight: 9
description: >
  Plugins API endpoint documentation.
---

The plugins endpoint allows you to list available detection plugins and get
details about a specific plugin.

## GET /api/plugins

Returns a list of all available plugins with their event counts.

### Parameters

| name   | placement | comment                           |
| ------ | --------- | --------------------------------- |
| accept | header    | Must be set to `application/json` |

### Example

{{< tabs "plugins-list-example" >}}

{{< tab "Curl" >}} {{< include-code "examples/api/plugins_list.sh" "sh" >}}
{{< /tab >}}

{{< tab "Python" >}}
{{< include-code "examples/api/plugins_list.py" "python" >}} {{< /tab >}}

{{< /tabs >}}

### Successful response

Receiving `200` means the request was successful and an array of plugins is
returned:

{{< include-code "examples/api/responses/plugins_list_response.json" "json" >}}

| field          | type   | description                              |
| -------------- | ------ | ---------------------------------------- |
| name           | string | Plugin identifier                        |
| description    | string | Human-readable description of the plugin |
| event_count1h  | int    | Number of events in the last hour        |
| event_count24h | int    | Number of events in the last 24 hours    |
| event_count7d  | int    | Number of events in the last 7 days      |

## GET /api/plugins/:name

Returns details about a specific plugin.

### Parameters

| name   | placement     | comment                           |
| ------ | ------------- | --------------------------------- |
| accept | header        | Must be set to `application/json` |
| name   | url parameter | The plugin name                   |

### Example

{{< tabs "plugin-detail-example" >}}

{{< tab "Curl" >}} {{< include-code "examples/api/plugins_detail.sh" "sh" >}}
{{< /tab >}}

{{< tab "Python" >}}
{{< include-code "examples/api/plugins_detail.py" "python" >}} {{< /tab >}}

{{< /tabs >}}

### Successful response

Receiving `200` means the request was successful:

{{< include-code "examples/api/responses/plugins_detail_response.json" "json" >}}

### Error response

Receiving `404` means the plugin was not found:

{{< include-code "examples/api/responses/plugins_not_found.json" "json" >}}

### Rate limiting

All requests to LeakIX.net's API are limited at ~1 request per second.

If the limit is reached, the API will return a `429` http status code and a
`x-limited-for` header.

The client MUST wait for the duration of `x-limited-for` before the next
request.

```http request
HTTP/1.1 429 Rate-limited
Date: Mon, 27 Jul 2009 12:28:53 GMT
x-limited-for: 344.24ms
```
