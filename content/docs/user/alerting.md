---
title: "Alerting"
weight: 4
description: >
  Managing your alert channels.
---

Our platform also allows you to configure alerts for the resources you have added, allowing you to receive updates in real-time. 
In this document, we will provide you with a guide for setting up and configuring alerts on your resources.

{{< tip "warning" >}}
Alerting is available for pro users only. See our various [plans](https://leakix.net/plans) to get access.
{{< /tip >}}

## Setting Up Alerts
After adding a few resources you will be able to access your alert channels from your settings. 

![diy](/images/alerts/addmenu.png)

To configure alert channels, simply click on setup button under the channel you'd like to configure.
You will then be taken to a page where you can configure the alert.

Once you are on the alert configuration page, you will be able to select the alerting channel you would like to use (e.g. `HTTP hook`, `Mattermost`, `Slack`, `PagerDuty`, etc.).

You can also select the minimum severity required for the alert to triggers. Enabling `Alert on service` will notify you
on every port and DNS discovered during our scan.

![diy](/images/alerts/mattermost.png)

