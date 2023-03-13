---
title: "Fields"
weight: 3
description: >
  LeakIX fields documentation.
---

LeakIX syntax is called YQL and is based on the opensource [YQL-Elastic](https://github.com/LeakIX/yql-elastic) library.

## Types

| type    | description                                                                  |
|---------|------------------------------------------------------------------------------|
| text    | Text is fuzzy and case insensitive                                           |
| keyword | Keyword is precise and case sensitive                                        |
| ip      | IP is precise and can be a CIDR range                                        |
| dns     | DNS will be matched from top domain (eg, `leakix.net` includes *.leakix.net) |
| integer | Numbers can be used in range queries                                         |
| date    | Date can be used in range queries                                            |

## Global fields

Global fields are available in both the [service](/docs/getting-started/#service) and [leak](/docs/getting-started/#leak) scope

| Field                            | Type    | Description                        | Example                     |
|----------------------------------|---------|------------------------------------|-----------------------------|
| plugin                           | keyword | Plugin name                        | `GitConfigPlugin`           |
| event_pipeline                   | keyword | Steps used for indexing the result | `CertStream`                |
| l9fp                             | keyword | LeakIX's fingerprint               |                             |
| time                             | date    | Indexing date                      | `2023-01-01`                |
| ip                               | ip      | IP                                 | `8.8.0.0/16`                |
| host                             | dns     | Domain/vhost if applicable         | `leakix.net`                |
| port                             | keyword | Port                               | `8000`                      |
| transport                        | keyword | Transports used                    | `tls`, `http`, `smb`        |
| http.url                         | keyword | URL path                           | `/.git/config`              |
| http.status                      | integer | HTTP status code                   | `401`                       |
| http.length                      | integer | HTTP content length                |                             |
| http.header                      | map     | HTTP headers                       | `http.header.server:Apache` |
| http.title                       | text    | HTML title                         |                             |
| summary                          | text    | Banner or summary                  |                             |
| ssl.detected                     | bool    | SSL detected                       |                             |
| ssl.jarm                         | keyword | JARM fingerprint                   |                             |
| ssl.cypher_suite                 | keyword | SSL cypher suite                   | `TLS_AES_128_GCM_SHA256`    |
| ssl.version                      | keyword | SSL version                        | `TLSv1.3`                   |
| ssl.certificate.cn               | dns     | SSL Common Name                    |                             |
| ssl.certificate.domain           | dns     | SSL domain list                    |                             |
| ssl.certificate.fingerprint      | keyword | SSL certificate fingerprint        |                             |
| ssl.certificate.key_algo         | keyword | SSL algorithm                      | `RSA`                       |
| ssl.certificate.key_size         | integer | SSL key size                       | `2048`                      |
| ssl.certificate.issuer_name      | text    | SSL certificate issuer name        |                             |
| ssl.certificate.not_before       | date    | SSL certificate start date         | `2023-01-01`                |
| ssl.certiticate.not_after        | date    | SSL certificate end date           |                             |
| ssl.certificate.valid            | bool    | SSL certificate validity           |                             |
| ssh.fingerprint                  | keyword | SSH fingerprint                    |                             |
| ssh.version                      | int     | SSH protocol version               |                             |
| ssh.banner                       | text    | SSH banner                         |                             |
| ssh.motd                         | text    | SSH message of the day             |                             |
| service.software.name            | keyword | Service software name              | `Apache`                    |
| service.software.version         | keyword | Service software version           |                             |
| service.software.os              | keyword | Service software OS                | `Ubuntu`                    |
| service.software.modules.name    | keyword | Service's module name              | `PHP`, `OpenSSL`            |
| service.software.modules.version | keyword | Service's module version           |                             |
| tags                             | keyword | Tag                                | `ntlm`                      |
| geoip.continent_name             | keyword | Continent name                     | `Europe`                    |
| geoip.region_iso_code            | keyword | Region ISO code                    |                             |
| geoip.city_name                  | keyword | City name                          |                             |
| geoip.country_iso_code           | keyword | Country ISO code                   | `FR`                        |
| geoip.country_name               | keyword | Country name                       | `France`                    |
| geoip.region_name                | keyword | Region name                        |                             |
| geoip.location.lat               | float   | Location latitude                  |                             |
| geoip.location.lon               | float   | Location longitude                 |                             |
| network.organization_name        | keyword | Network operator name              | `Hetzner Online GmbH`       |
| network.asn                      | int     | Network operator AS number         | `16276`                     |
| network.network                  | keyword | Network range                      |                             |

## Leak specific fields

Leak fields are only available in the [leak](/docs/getting-started/#leak) scope.


| Field                        | Type    | Description                           | Example            |
|------------------------------|---------|---------------------------------------|--------------------|
| creation_date                | date    | Leak first detection date             | `2023-01-01`       |
| update_date                  | date    | Leak last detection date              | `2023-01-01`       |
| age                          | integer | Number of days the leak has been open |
| leak.severity                | keyword | Leak severity                         | `critical`, `high` |
| leak.dataset.rows            | int     | Leak number of rows                   |                    |
| leak.dataset.files           | int     | Leak number of files                  |                    |
| leak.dataset.size            | int     | Leak size in bytes                    |                    |
| leak.dataset.collections     | int     | Leak number of databases              |                    |
| leak.dataset.infected        | bool    | Service is infected/ransomed          |                    |
| leak.dataset.ransom_notes    | text    | Ransom notes left public              | `btc`              |
| service.credentials.noauth   | bool    | Service credentials not present       |                    |
| service.credentials.username | keyword | Service username used                 |                    |
| service.credentials.password | keyword | Service password used                 |                    |
| service.credentials.key      | keyword | Service key used                      |                    |
| service.credentials.raw      | keyword | Service other credential used         |                    |
