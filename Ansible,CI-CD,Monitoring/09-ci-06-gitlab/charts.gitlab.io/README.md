## GitLab Helm Charts

This repository collects GitLab's official Helm charts from their individual
repos and automatically publish them to our Helm repo, located at
[charts.gitlab.io](https://charts.gitlab.io). [Helm](https://helm.sh/) is a
package manager for Kubernetes, making it easier to deploy, upgrade, and
maintain software like GitLab.

**IMPORTANT:** Before using the `gitlab/gitlab` chart for a production-grade implementation, please read the [GitLab Helm chart documentation](https://docs.gitlab.com/charts/). Detailed [installation instructions](https://docs.gitlab.com/charts/installation/) can be found there.

The charts collected and published currently by this repository are the following:

| Chart name   | Status       | Remark
|--------------|--------------|----------|
| [gitlab](https://gitlab.com/gitlab-org/charts/gitlab.git)       | GA | Deploy the GitLab application. |
| [gitlab-agent](https://gitlab.com/gitlab-org/charts/gitlab-agent.git) | GA | Deploys the GitLab Agent for Kubernetes. |
| [gitlab-runner](https://gitlab.com/gitlab-org/charts/gitlab-runner.git) | GA | Deploys the GitLab CI/CD Runner. |
| [gitlab-omnibus](https://gitlab.com/charts/gitlab-omnibus.git) | Deprecated | Replaced by the [GitLab Chart](https://gitlab.com/gitlab-org/charts/gitlab). |
| [kubernetes-gitlab-demo](https://gitlab.com/charts/kubernetes-gitlab-demo.git) | Deprecated | Should not be used. |
| [auto-deploy-app](https://gitlab.com/gitlab-org/charts/auto-deploy-app) | Deprecated | Replaced by [Auto DevOps inline chart](https://gitlab.com/gitlab-org/cluster-integration/auto-deploy-image). |
| [plantuml](https://gitlab.com/gitlab-org/charts/plantuml) | Deprecated | GitLab.com uses [tanka-deployments](https://gitlab.com/gitlab-com/gl-infra/k8s-workloads/tanka-deployments) |
| [knative](https://gitlab.com/gitlab-org/charts/knative) | Deprecated | Deprecated in [GitLab 15.0](https://about.gitlab.com/releases/2022/05/22/gitlab-15-0-released/). formerly used for the GitLab knative one click install as part of [removed GitLab Serverless](https://docs.gitlab.com/ee/update/removals.html#gitlab-serverless) |
| [elastic-stack](https://gitlab.com/gitlab-org/charts/elastic-stack) | Deprecated | Used for the Elastic Stack managed application |
| [apparmor](https://gitlab.com/gitlab-org/charts/apparmor) | Deprecated | [Deprecated](https://gitlab.com/gitlab-org/gitlab/-/issues/352282) and formerly used for the AppArmor profile loader and Pod Security Policies |

More information is available in our [chart documentation](https://docs.gitlab.com/charts/).

### Usage

To use the charts, the Helm tool must be installed and initialized. The best
place to start is by reviewing the [Helm Quick Start Guide](https://helm.sh/docs/intro/quickstart/).

Installation instructions, including configuration options, can be found in our [documentation](http://docs.gitlab.com/ce/install/kubernetes/).

### GitLab Helm Charts Issue Tracker

Issues related to the Charts can be logged for the respective chart at: <https://gitlab.com/groups/gitlab-org/charts/-/issues>

### Contributing to the Charts

We welcome contributions and improvements. The source repo for our Helm Charts can be found here: <https://gitlab.com/charts/charts.gitlab.io>

Please see the [contribution guidelines](CONTRIBUTING.md)
