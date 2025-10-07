---
title: 'Dork library'
weight: 4
description: >
  LeakIX dork library.
---

List of useful dorks.

## Country filtering

[Search](https://leakix.net/search?scope=leak&q=%2B%28country%3AFrance+host%3Afr%29)
for IPs in `France` and domains with `fr` TLD.

```sql
+(country:"France" host:"fr")
```

{{< tip >}} Country is case sensitive. {{< /tip >}}

[Search](https://leakix.net/search?scope=leak&q=%2B%28geoip.continent_name%3AEurope+-country%3ARussia%29)
for results in `Europe` without `Russia`.

```sql
+geoip.continent_name:"Europe" -country:"Russia"
```

## Severity filtering

[Search](https://leakix.net/search?scope=leak&q=%28%2Bplugin%3AGitConfigHttpPlugin+%2Bseverity%3Acritical%29+%28%2Bplugin%3ADotDsStoreOpenPlugin+%2Bseverity%3Ahigh%29)
for all `GitConfigHttpPlugin` with `critical` severity OR all
`DotDsStoreOpenPlugin` with `high` severity.

```sql
(+plugin:"GitConfigHttpPlugin" +severity:"critical") (+plugin:"DotDsStoreOpenPlugin" +severity:"high")
```

## Dataset filtering

[Search](https://leakix.net/search?scope=leak&q=%2Bdataset.infected%3Atrue+%2Bdataset.size%3A%3E10000000000)
for dataset bigger than ~1GB and infected by a ransom note.

```sql
+dataset.infected:true +dataset.size:>10000000000
```

[Search](https://leakix.net/search?scope=leak&q=%2Bdataset.ransom_notes%3Abtc)
for dataset with a ransom note containing `btc`.

```sql
+dataset.ransom_notes:"btc"
```

## SSL filtering

[Search](https://leakix.net/search?scope=service&q=%2Bssl.certificate.issuer_name%3AFortiGate)
for results with FortiGate as SSL issuer name.

```sql
+ssl.certificate.issuer_name:"FortiGate"

```

[Search](https://leakix.net/search?scope=service&q=ssl.certificate.cn%3A%22co.uk%22+ssl.certificate.domain%3A%22co.uk%22)
for results with `co.uk` as TLD in SSL Common Names or domains.

```sql
ssl.certificate.cn:"co.uk" ssl.certificate.domain:"co.uk"
```

## Date filtering

[Search](https://leakix.net/search?scope=leak&q=%2B%28ssl.certificate.cn%3A%22co.uk%22+ssl.certificate.domain%3A%22co.uk%22%29+%2Bcreation_date%3A%3E2023-01-01)
for results with `co.uk` as TLD in SSL Common Names or domains and created after
`2023-01-01`.

```sql
+(ssl.certificate.cn:"co.uk" ssl.certificate.domain:"co.uk") +creation_date:>2023-01-01
```

## Leaked GitHub tokens

[Search](https://leakix.net/search?scope=leak&q=%2Bevents.leak.severity%3A%22critical%22+%2Bplugin%3A%22GitConfigHttpPlugin%22+%2B%22github.com%22)
for results with exposed git config with `critical` severity and with
`github.com` present in their text.

```sql
+events.leak.severity:"critical" +plugin:"GitConfigHttpPlugin" +"github.com"
```

{{< tip "warning" >}} Do you have dorks to share? Feel free to open a
[PR](https://github.com/LeakIX/DocSite/pulls) or raise an
[issue](https://github.com/LeakIX/DocSite/issues/new/choose 'Open a Github Issue')(s).
{{< /tip >}}
