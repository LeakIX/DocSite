---
title: 'Getting started'
weight: 1
description: >
  LeakIX introduction.
---

## Introduction

LeakIX (/liːk aɪ eks/) is the first platform combining a search engine indexing
public information AND an open reporting platform linked to the results.

## Scopes

The search engine is divided in two searchable scopes:

### Services

The service scope is an index of everything we have scanned over the last year.
It includes IPs and virtualhost.

We keep various information like the TCP or HTTP banner.

### Leak

In this scope we index mis-configurations and vulnerabilities discovered during
our service scans.

A leak can be:

- A well known identified vulnerability
- An infrastructure misconfiguration including but not limited to:
  - Status and monitoring pages containing sensitive information
  - Public configuration files containing sensitive information
  - Misconfigured ACL leaving services that should be protected exposed publicly

{{< tip "warning" >}} Due to the sensitive nature of the information we index,
access to critical leaks is reserved to trusted users and
[commercial plans](https://leakix.net/plans). {{< /tip >}}

### Clients

We provide and support two official clients: Python and Go.

- Go: https://github.com/LeakIX/LeakIXClient
- Python client: https://github.com/LeakIX/LeakIXClient-Python

#### Third-party Clients

- **LeakPy** (Unofficial): A third-party Python client with CLI support -
  [GitHub](https://github.com/Chocapikk/LeakPy) |
  [Documentation](https://leakpy.readthedocs.io/en/latest/)
