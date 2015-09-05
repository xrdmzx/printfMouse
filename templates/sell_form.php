<form action="sell.php" method="post">
    <fieldset>
        <div class="form-group">
            
	    <select class="form-control" name="symbol">
                <option value=""> </option>

		<? 
		     foreach($positions as $position)
		     {
			print("option value= '{$position["symbol"]}'> {$position["symbol"]}</option>\n");
		     }			
		?>

           </select>

        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-default">Sell</button>
        </div>
    </fieldset>
</form>
