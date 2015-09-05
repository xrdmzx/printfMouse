<?php

    // configuration
    require("../includes/config.php");

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // else render form
        render("sell_form.php", ["title" => "Sell"]);
    }
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {

	// locate this users portfolio data [each row = stock for that company]
	$id = $_SESSION["id"];
	$rows = query("SELECT * FROM portfolio WHERE id = $id ");

	// get cash
	$user = query("SELECT cash FROM users WHERE id =$id");
	$cash = $user[0]["cash"];


	// iterate through each row [stock]
	$positions = [];
	foreach ($rows as $row)
	{
	    $stock = lookup($row["symbol"]);
	    if ($stock !== false)
	    {
		$positions[] = [
		    "name" => $stock["name"],
		    "price" => $stock["price"],
		    "shares" => $row["shares"],
		    "symbol" => $row["symbol"],
		    "total" =>  $stock["price"] * $row["shares"]
		  ];
	    }
	}
	if ($stock == false)
	{
	    apologize("the stock is false");
	}
	else
	{ 
	    $sell_stock = query("DELETE FROM portfolio WHERE id = $id AND symbol = ?" , P);

	$get_cash = query("UPDATE users SET cash = cash + ?, $stock ");
	 
	render("sell_form.php",["title" => "Sell", "positions" => $positions]);
    }
?>
