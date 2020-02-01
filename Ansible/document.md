sudo apt update
sudo apt install apache2 -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo apt install php-cli
sudo systemctl restart apache2
sudo nano /var/www/html/info.php
<?php
phpinfo();
?>

centos:---
sudo yum install httpd -y
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo yum install php php-mysql -y
sudo systemctl restart httpd.service
sudo vi /var/www/html/info.php
<?php phpinfo(); ?>
