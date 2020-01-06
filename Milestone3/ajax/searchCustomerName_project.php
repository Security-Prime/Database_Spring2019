<?php
        require "dbutil.php";
        $db = DbUtil::loginConnection();
        $stmt = $db->stmt_init();
        if($stmt->prepare("select * from Customer where CustLName like ?") or die(mysqli_error($db))) {
                $searchString = '%' . $_GET['searchLastName'] . '%';
                $stmt->bind_param(s, $searchString);
                $stmt->execute();
                $stmt->bind_result($CustID, $CustEmail, $CustFName, $CustLName);
                echo "<table border=1><th>CustID</th><th>CustEmail</th><th>CustFName</th><th>CustLName</th>\n";
                while($stmt->fetch()) {
                        echo "<tr><td>$CustID</td><td>$CustEmail</td><td>$CustFName</td><td>$CustLName</td></tr>";
                }
                echo "</table>";
                $stmt->close();
        }
        $db->close();
?>
