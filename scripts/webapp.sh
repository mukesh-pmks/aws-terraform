#!/bin/bash

yum update -y

yum install -y httpd php php-mysql

systemctl start httpd

systemctl enable httpd

echo "<?php" >> /var/www/html/myApp.php

echo "\$conn = new mysqli('mydatabase.ShaanAWSDNS.internal', 'root', 'secret', 'test');" >> /var/www/html/myApp.php

echo "\$sql = 'SELECT * FROM Employees'; " >> /var/www/html/myApp.php

echo "\$result = \$conn->query(\$sql); " >>  /var/www/html/myApp.php

echo "while(\$row = \$result->fetch_assoc()) { echo 'the value is: ' . \$row['NAME'],  \$row['ADDRESS'];} " >> /var/www/html/myApp.php

echo "\$conn->close(); " >> /var/www/html/myApp.php

echo "?>" >> /var/www/html/myApp.php
