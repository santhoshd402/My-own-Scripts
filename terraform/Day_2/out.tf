output "machine1-ip" {
  value = "${aws_instance.web1.public_ip}"
}
output "machine2-ip" {
  value = "${aws_instance.web2.public_ip}"
}
