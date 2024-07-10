data "google_project" "project_number" {
  project_id = var.project_id 
}

resource "google_project_iam_member" "ksa_access" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "principal://iam.googleapis.com/projects/${data.google_project.project_number.number}/locations/global/workloadIdentityPools/${var.project_id}.svc.id.goog/subject/ns/default/sa/workload-identity-sa"
}



