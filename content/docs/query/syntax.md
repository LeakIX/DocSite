---
title: "Syntax"
weight: 2
description: >
  This page tells you how to get started with the Compose theme.
---


LeakIX syntax is called YQL and is based on the opensource [YQL-Elastic](https://github.com/LeakIX/yql-elastic) library.

## Features

- Supports grouping
- Supports field

## Lexical declarations

- A term can be a single word
- A term can be a phrase between quote (`"`)
- A term can be a field, prefixed by `:` with or without a (single word or phrase) as value
- Any term or group of term following `+` is a `REQUIRE` condition
- Any term or group of term following `-` is a `EXCLUDE` condition
- Any term or group of term without preceding operator is a `OPTIONAL` condition, unless there's only one term
- A group is query inside delimiting `()`
- Groups can have sub-groups
- Any field having a `>` after its `:` is a greater range condition
- Any field having a `<` after its `:` is a lower range condition
- Any field having a `=` after its `:` is a precise match condition

{{< tip "warning" >}}
When multiple terms are provided without the `+` operator, the default behavior is to make it `OPTIONAL`.
{{< /tip >}}

## Examples

#### Search for single term

The following example would [search](https://leakix.net/search?scope=service&q=TornadoServer) the index for the term `TornadoServer`. The term is required since it's alone.

```sql
TornadoServer
```

#### Search for a phrase

The following example would [search](https://leakix.net/search?scope=service&q=%22Location%3A+%2Fhome%2F%22) the index for the phrase `Location: /home/`. The term is required since it's alone.

```sql
"Location: /home/"
```

{{< tip >}}
Notice how phrase with spaces are enclosed between double quotes (`"`) to make it a single term.
{{< /tip >}}

#### Search for multiple required terms

The following example would [search](https://leakix.net/search?scope=service&q=%2B%22Location%3A+%2Fhome%2F%22+%2B%22Apache%22) the index for the phrase `Location: /home/` AND the term `Apache`. Both terms are required since they're prefixed with `+`.

```sql
+"Location: /home/" +Apache
```

#### Using fields

The following example would [search](https://leakix.net/search?scope=service&q=jarm%3A%2229d29d15d29d29d00042d42d0000009435214b849738c4ebab4534b5d158dd%22) the index for the field `jarm` matching `29d29d15d29d29d00042d42d0000009435214b849738c4ebab4534b5d158dd`.

```sql
jarm:"29d29d15d29d29d00042d42d0000009435214b849738c4ebab4534b5d158dd"
```

{{< tip >}}
Notice how fields can also be phrases by using double quotes `"`.
{{< /tip >}}

#### Using ranges

The following example would [search](https://leakix.net/search?scope=service&q=%2Bssl.certificate.not_before%3A%3E2023-03-10) the index for the field `ssl.certificate.not_before` greater than `2023-03-10`.

```sql
ssl.certificate.not_before:>2023-03-10
```


#### Combining optional and required terms

The following example would [search](https://leakix.net/search?page=0&q=%2B%22Location%3A+%2Fhome%2F%22+%2B%22Apache%22+%2Bjarm%3A%2215d3fd16d29d29d00042d43d0000009ec686233a4398bea334ba5e62e34a01%22&scope=service) the index for the phrase `Location: /home/` AND either the term `Apache` OR `nginx` AND for the field `jarm` matching `15d3fd16d29d29d00042d43d0000009ec686233a4398bea334ba5e62e34a01` AND for the field `ssl.certificate.not_before` greater than `2023-03-10`.

```sql
+"Location: /home/" +(Apache nginx) +jarm:"15d3fd16d29d29d00042d43d0000009ec686233a4398bea334ba5e62e34a01" +ssl.certificate.not_before:>2023-02-10
```

{{< tip >}}
Notice how the group between `()` is required by prefixing it with `+`.
{{< /tip >}}

{{< tip >}}
Notice how the terms inside `()` are optional since they have no prefix.
{{< /tip >}}

