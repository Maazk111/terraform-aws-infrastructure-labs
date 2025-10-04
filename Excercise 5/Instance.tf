resource "aws_instance" "web" {
  ami                    = var.amiID[var.region]
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.dove_key.key_name
  vpc_security_group_ids = [aws_security_group.dove-sg.id]
  availability_zone      = var.zone1

  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  connection {
    type        = "ssh"
    user        = var.webuser
    private_key = file("dovekey")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh",
    ]

  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ipaddress.txt"
  }
}


resource "aws_ec2_instance_state" "web_state" {
  instance_id = aws_instance.web.id
  state       = "running"
}

output "public_ip" {
  description = "Public IP of ubuntu instance"
  value       = aws_instance.web.public_ip
}

output "webPrivateIP" {
  description = "Private IP of ubuntu instance"
  value       = aws_instance.web.private_ip

}


