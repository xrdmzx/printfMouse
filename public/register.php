<?php

    // configuration
    require("../includes/config.php");

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // else render form
        render("register_form.php", ["title" => "Register"]);
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        // TODO
        // validate submission
        if (empty($_POST["username"]) || empty($_POST["password"]))
        {
            apologize("You must provide your username and password.");
        }
        else if ($_POST["password"] != $_POST["confirmation"])
        {
            apologize("Your passwords didn't match.");
        }
	
	else
	{
		// insert user into database
		$insert = query("INSERT INTO users (username, hash) VALUES(?, ?)", $_POST["username"], crypt($_POST["password"]));

		// if we found user already in database
		if ($insert === false)
		{
			apologize("User already exists");
		}
		else
		{
		    // get id of insert
		    $row = query("SELECT LAST_INSERT_ID() AS id");
		    $id = $row[0]["id"];
		    // remember user is logged in
		    $_SESSION["id"] = $id;

		    // redirect to home
                    redirect("/");
		}
	}
    }

?>
