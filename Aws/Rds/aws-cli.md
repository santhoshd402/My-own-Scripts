#### RDS:

aws rds create-db-instance  --engine mysql --db-instance-identifier test-rds --db-instance-class db.t2.micro --master-username "admin" --master-user-password "Santhu.d402" --allocated-storage 20 

--db-name "sample"

aws rds delete-db-instance --db-instance-identifier "qt-rds-from-cli" --skip-final-snapshot --delete-automated-backups

aws ec2 run-instances --image-id ami-xxxxxxxx --count 1 --instance-type t2.micro --key-name MyKeyPair --security-group-ids sg-903004f8 --subnet-id subnet-6e7f829e

aws ec2 run-instances --image-id ami-06d51e91cea0dac8d  --count 1 --instance-type t2.micro --key-name practice_chef --security-group-ids sg-088d77a8ef7d630c0 

aws ec2 describe-instances

aws ec2 terminate-instances --instance-ids i-0932c8853df1622fe

