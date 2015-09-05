<?php

    // configuration
    require("../includes/config.php"); 

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // else render form
        render("quote_form.php", ["title" => "Quote"]);	
    }

    // if form submitted via POST (properly)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {

	// make sure something is typed in form
 	if (empty($_POST["symbol"]))
        {
            apologize("You must provide a stock symbol.");
        }

	else
	{
	    // check yahoo.com for quote using symbol
	    $stock = lookup($_POST["symbol"]);

	    // check if stock is valid
	    if($stock === false)
	    {
	        apologize("invalid stock.");
	    }
	    // else, render page with stock information
	    else
	    {
	        render("quote_display.php",["title" => "Quote", "symbol" => $stock["symbol"], "name" => $stock["name"], "price" => $stock["price"]]);
	    }

         }
    }
?>
