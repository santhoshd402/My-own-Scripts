aws rds create-db-instance --db-instance-identifier "qt-rds-from-cli" --db-instance-class "db.t2.micro" 
--allocated-storage 20 --engine "mysql" --master-username "admin" --master-user-password "Santhu.d402" 
--availability-zone "us-west-2a" --publicly-accessible

--vpc-security-group-ids "vpc-9f338ce7"
--db-security-groups "sg-088d77a8ef7d630c0"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

aws rds describe-db-instances qt-rds-from-cli

aws rds delete-db-instance --db-instance-identifier qt-rds-from-cli --skip-final-snapshot 
--delete-automated-backups

#create read replica-------------

aws rds create-db-instance-read-replica --db-instance-identifier qt-rds-from-cli-rrep 
--source-db-instance-identifier qt-rds-from-cli

aws rds create-db-instance-read-replica --db-instance-identifier "qt-rds-from-cli-rrep" 
--source-db-instance-identifier qt-rds-from-cli 


##create snapshot---------------
aws rds create-db-snapshot --db-snapshot-identifier qt-rds-from-cli-snap 
--db-instance-identifier qt-rds-from-cli

# Create EC2 ubuntu 16.04 machine


aws ec2 create-vpc --cidr-block 192.168.0.0/16 --no-amazon-provided-ipv6-cidr-block

create-subnet --availability-zone