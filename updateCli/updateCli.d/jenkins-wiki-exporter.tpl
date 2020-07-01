source:
  kind: githubRelease
  spec:
    owner: "jenkins-infra"
    repository: "jenkins-wiki-exporter"
    token: "{{ requiredEnv .github.token }}"
    username: "olblak"
    version: "latest"
conditions:
  docker:
    name: "Docker Image Published on Registry"
    kind: dockerImage
    spec:
      image: "jenkinsciinfra/jenkins-wiki-exporter"
targets:
  imageTag:
    name: "jenkins-wiki-exporter docker tag"
    kind: yaml
    spec:
      file: "charts/jenkins-wiki-exporter/values.yaml"
      key: image.tag
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: "jenkins-infra"
        repository: "charts"
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "master"
  appVersion:
    name: "jenkins-wiki-exporter appversion"
    kind: yaml
    spec:
      file: "charts/jenkins-wiki-exporter/Chart.yaml"
      key: appVersion
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: "jenkins-infra"
        repository: "charts"
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "master"
