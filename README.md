# labophase-platform

Infrastructure and cluster configuration for **labophase** on [Civo](https://www.civo.com).

- **Terraform** provisions the network, firewall and k3s cluster.
- **GitHub Actions** runs Terraform: plan on PR, apply on merge to `main`.

## Layout

```
terraform/
  modules/         reusable building blocks (network, kubernetes)
  environments/
    dev/           one folder per environment, each with its own state
```

## How changes flow

1. Branch off `main` and change code under `terraform/`.
2. Open a PR. CI runs `fmt`, `validate` and `plan`; review the plan in the run summary.
3. Merge. CI applies the exact plan that was reviewed.

## Setup

### One-time bootstrap

Terraform state lives in a Civo Object Store bucket, manuually created:

1. Create an Object Store (e.g. `terraform-bucket`) and an Object Store credential in the Civo dashboard.
2. Set the bucket name and endpoint in `terraform/environments/<env>/backend.tf`.

### GitHub secrets

| Secret                  | Purpose                        |
|-------------------------|--------------------------------|
| `CIVO_TOKEN`            | Civo API key                   |
| `AWS_ACCESS_KEY_ID`     | Object Store access key (state) |
| `AWS_SECRET_ACCESS_KEY` | Object Store secret key (state) |

## Local usage (read-only)

```bash
export CIVO_TOKEN=... AWS_ACCESS_KEY_ID=... AWS_SECRET_ACCESS_KEY=...
cd terraform/environments/dev
terraform init
terraform plan
```

### Access the cluster

```bash
terraform output -raw kubeconfig > ~/.kube/labophase-dev.yaml
export KUBECONFIG=~/.kube/labophase-dev.yaml
kubectl get nodes
```
