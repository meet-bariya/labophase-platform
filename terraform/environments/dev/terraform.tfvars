project           = "labophase"
environment       = "dev"
region            = "MUM1"
api_allowed_cidrs = ["0.0.0.0/0"]

node_size  = "g4s.kube.medium"
node_count = 2

gitops_repo_url           = "https://github.com/meet-bariya/labophase-platform.git"
argocd_chart_version      = "10.9.6"
argocd_apps_chart_version = "2.0.6"
