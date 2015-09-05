
<?php

    // configuration
    require("../includes/config.php"); 

// locate this users colony data
//$username = $_SESSION["username"];
$cage_rows = query("SELECT * FROM cage WHERE username = ?", $_SESSION["username"]);
//$mice_rows = query("SELECT * FROM mice WHERE id = $id ");

// get cash
//$user = query("SELECT cash FROM users WHERE id =$id");
//$cash = $user[0]["cash"];

// iterate through each cages table and get values
$cages = [];
foreach ($cage_rows as $row)

        $cages[] = [
            "gene" => $row["gene"],
            "count" => $row["count"],
            "mice" => $row["mice"],
            "pups" => $row["pups"],
            "females" => $row["females"],
            "males" => $row["males"],
            "event" =>  $row["event"]
	  ];

    // render portfolio
    render("home.php", ["title" => "Home", "cages" => $cages]);

?>
