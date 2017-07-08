## a simple form
<form action="action.php" method="post">
 <p>姓名: <input type="text" name="name" /></p>
 <p>年龄: <input type="text" name="age" /></p>
 <p><input type="submit" /></p>
</form>

## printing data from our form
Hi <?php echo htmlspecialchars($_POST['name']); ?>.
You are <?php echo (int)$_POST['age']; ?> years old.
# a sample output of thie script may be:
#   Hi Joe. You are 22 years old.