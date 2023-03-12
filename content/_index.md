+++
title = "Home"
[data]
baseChartOn = 3
colors = ["#627c62", "#11819b", "#ef7f1a", "#4e1154"]
columnTitles = ["Section", "Status", "Author"]


+++
{{< block "grid-2" >}}
{{< column >}}

# Welcome to LeakIX documentation.

LeakIX is a red-team search engine indexing mis-configurations and vulnerabilities online. 

This website contains documentation on how to use the engine and its features.

{{< tip "warning" >}}
Feel free to open a [PR](https://github.com/LeakIX/DocSite/pulls), raise an [issue](https://github.com/LeakIX/DocSite/issues/new/choose "Open a Github Issue")(s) or request new feature(s). 
{{< /tip >}}

<!--
{{< tip >}}
You can generate diagrams, flowcharts, and piecharts from text in a similar manner as markdown using [mermaid](./docs/compose/mermaid/).

Or, [generate graphs, charts](docs/compose/graphs-charts-tables/#show-a-pie-doughnut--bar-chart-at-once) and tables from a csv, ~~or a json~~ file.
{{< /tip >}}
-->
{{< button "docs/" "Read the Docs" >}}
{{< /column >}}

{{< column >}}
![diy](/images/leakix-welcome.png)
{{< /column >}}
{{< /block >}}
