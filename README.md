<div align="center">

<img src="https://camo.githubusercontent.com/5b298bf6b0596795602bd771c5bddbb963e83e0f/68747470733a2f2f692e696d6775722e636f6d2f7031527a586a512e706e67" align="center" width="144px" height="144px"/>

### My home operations repository :octocat:

_... managed with Flux, Renovate and GitHub Actions_ :robot:

</div>

<br/>

<div align="center">

 [![Discord](https://img.shields.io/discord/673534664354430999?style=for-the-badge&label=discord&logo=discord&logoColor=white)](https://discord.gg/k8s-at-home)
 [![k3s](https://img.shields.io/badge/v1.23.1-brightgreen?style=for-the-badge&logo=kubernetes&logoColor=white)](https://k3s.io/)
 [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=for-the-badge)](https://github.com/pre-commit/pre-commit)
 [![GitHub Workflow Status](https://img.shields.io/github/workflow/status/jr0dd/home-ops/Schedule%20-%20Renovate?label=renovate&logo=renovatebot&style=for-the-badge)](https://github.com/jr0dd/home-ops/actions/workflows/schedule-renovate.yaml)
 [![Lines of code](https://img.shields.io/tokei/lines/github/jr0dd/home-ops?style=for-the-badge&color=brightgreen&label=lines&logo=codefactor&logoColor=white)](https://github.com/jr0dd/home-ops/graphs/contributors)

</div>

---

## :book:&nbsp; Overview

This is home to my personal Kubernetes cluster. [Flux](https://github.com/fluxcd/flux2) watches this Git repository and makes the changes to my cluster based on the manifests in the [cluster](./cluster/) directory. [SOPS](https://toolkit.fluxcd.io/guides/mozilla-sops/) encrypts the secrets so everything can be kept in a public repo as transparent as possible.

Currently I only have a single node running on Ubuntu 21.04 as the master-node and storage-node. This was recently migrated from TrueNAS SCALE using the NAS role I have been working on.

## Prometheus Rules

All my prometheus recording/alerting rules found in this repo can be found in my [prometheus-rules](https://github.com/jr0dd/prometheus-rules) repo.

## :handshake:&nbsp; Community

Thanks to all the people who donate their time to the [k8s@home](https://github.com/k8s-at-home/) community.
This repo would not exist if it wasn't for the shared knowledge.

If you want to learn more start with this template [here](https://github.com/k8s-at-home/template-cluster-k3s/)
