module "service_account" {
  source        = "../modules/service-account"
  project_id    = var.project_id
  names         = ["single-account"]
  project_roles = ["${var.project_id}=>roles/owner"]
}


module "jenkins_instance_template" {
  source              = "../modules/instance_template"
  region              = var.region
  project_id          = var.project_id
  subnetwork          = "default"
  service_account     = {email = module.service_account.iam_email, scopes=["service-control", "storage-full"]}
  source_image_family = "ubuntu-1804-lts"
  metadata = {
    startup-script = <<SCRIPT
        wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -\n
        sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
        apt-get update
        apt install jenkins
        systemctl enable jenkins
        systemctl start jenkins
        SCRIPT
    ssh-keys       = "mkrul:${file("~/.ssh/id_rsa.pub")}"
  }
}

module "jenkins__instance" {
  source            = "../modules/compute_instance"
  region            = var.region
  subnetwork        = "default"
  num_instances     = var.num_instances
  hostname          = "jenkins"
  instance_template = module.jenkins_instance_template.self_link
}