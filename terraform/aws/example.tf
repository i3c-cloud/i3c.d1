variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "ssh_key_name" {}

variable "aws_region" {
  default = "us-east-1"
}

/*resource "aws_key_pair" "test1" {
  key_name   = "test1"
  public_key = "${var.aws_keypair_test1}"
}*/

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

/*resource "aws_instance" "Ansible-Control-Server" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
  key_name = "test1"

/*provisioner "local-exec" {
    //command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}*/


resource "aws_instance" "Ansible-Host-1" {
  //ami           = "ami-b374d5a5"
  ami = "ami-0a313d6098716f372"
  instance_type = "t2.micro"
  key_name = "test1"

/*provisioner "local-exec" {
    command = " &&  && "
  }
*/
  provisioner "remote-exec" {
    inline = [
      //"sudo -i",
      "sudo adduser --disabled-password --gecos \"\" ansible",
      "sudo adduser ansible sudo",
      "sudo sh -c 'echo \"ansible  ALL=(ALL) NOPASSWD: ALL\" >> /etc/sudoers.d/ansible'",
      "sudo chmod 0440 /etc/sudoers.d/ansible",
      "sudo cp -R /home/ubuntu/.ssh /home/ansible/",
      "sudo chown -R ansible:ansible /home/ansible/.ssh",
      "sudo apt-get install -y python"
    ],
      connection {
    type     = "ssh"
    user     = "ubuntu"
    //password = "${var.root_password}"
     private_key   = "${file("/run/secrets/aws/sshKeys/${var.ssh_key_name}")}"
  }
  }

}


/*resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}*/

