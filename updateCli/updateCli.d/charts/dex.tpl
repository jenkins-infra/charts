source:
  kind: helmChart
  spec:
    url: https://kubernetes-charts.storage.googleapis.com
    name: dex

conditions:
  exist:
    name: "Dex helm chart available on Registry"
    kind: helmChart
    spec:
      url: https://kubernetes-charts.storage.googleapis.com
      name: dex

targets:
  chartVersion:
    name: "stable/dex Helm Chart"
    kind: yaml
    spec:
      file: "helmfile.d/dex.yaml"
      key: "releases[0].version"
    scm:
      github:
        user: "updatecli"
        email: "updatecli@olblak.com"
        owner: "jenkins-infra"
        repository: "charts"
        token: {{ requiredEnv "UPDATECLI_GITHUB_TOKEN" }}
        username: "olblak"
        branch: "master"
