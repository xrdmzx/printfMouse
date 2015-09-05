<style>
p.uppercase{
    text-transform: uppercase;
}
</style>

<div id = "middle">
    <?= ($name) ?>
    <p class = "uppercase"> (<?= htmlspecialchars($symbol) ?>) </p>
    <strong> $<?= number_format($price, 2) ?> </strong> <br>
</div>


