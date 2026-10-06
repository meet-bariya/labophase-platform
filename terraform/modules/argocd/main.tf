resource "helm_release" "argocd" {
    name = "argocd"
    namespace = "argocd"
    create_namespace = true
    repository = "https://argoproj.github.io/argo-helm"
    chart = "argo-cd"
    version = var.argocd_chart_version
}

resource "helm_release" "root" {
    name = "argocd-root"
    namespace = "argocd"
    repository = "https://argoproj.github.io/argo-helm"
    chart = "argocd-apps"
    version = var.argocd_apps_chart_version

    values = [yamlencode({
        applications = {
            root = {
                namespace = "argocd"
                project = "default"
                source = {
                    repoURL = var.repo_url
                    targetRevision = "main"
                    path = var.path
                }
                destination = {
                    server = "https://kubernetes.default.svc"
                    namespace = "argocd"
                }
                syncPolicy = {
                    automated = { prune = true, selfHeal = true }
                }
            }
        }
    })]

    depends_on = [helm_release.argocd]
}
