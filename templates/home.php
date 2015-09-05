	    <div id="middle">
<ul class="nav nav-pills">
    <li><a href="quote.php">Search</a></li>
    <li><a href="buy.php">Cages</a></li>
    <li><a href="sell.php">Mice</a></li>
    <li><a href="sell.php">Events</a></li>
    <li><a href="history.php">History</a></li>
    <li><a href="logout.php"><strong>Log Out</strong></a></li>
</ul>

<ul class="cage-grid-view">
    <?php foreach ($cages as $cage): ?>
	 <li>
	    <h2><?= $cage["gene"] ?></h2>
		    <ul>  
	            <li> <p> <?= $cage["mice"] ?> </p> </li>
	            <li> <p> <?= $cage["pups"] ?> </p> </li>
            </ul>
	</li>
    <?php endforeach ?>
</ul>	

       </div>
