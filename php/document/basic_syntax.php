## opening and closing tags

# which tell PHP to start and stop interpreting the code between them
<?php ... ?>

# PHP also allows for short open tag
<? ... ?>

## php parser

# when the php interpreter hits the ?> closing tags
#   it simply start outputting whatever it finds

<div></div>
<p>This is going to be ignored by PHP and displayed by the browser.</p>
<?php echo 'While this is going to be parsed.'; ?>
<p>This will also be ignored by PHP and displayed by the browser.</p>

## using condition

# php will skip the block where the condition is not met
#   even though they are outside of the php open/close tags

<?php if ($expression == true): ?>
  This will show if the expression is true.
<?php else: ?>
  Otherwise this will show.
<?php endif; ?>

## semicolon

<?php
    echo 'This is a test';
?>

# the closing tag of a block of PHP code automatically implies a semicolon
#   you do not need to have a semicolon terminating the last line of a PHP block
<?php echo 'This is a test' ?>

# the closing tag of a PHP block at the end of a file is optional
<?php echo 'We omitted the last closing tag';

## comment style

<?php
    echo "This is a test"; // This is a one-line c++ style comment
    /* This is a multi line comment
       yet another line of comment */
    echo "This is yet another test";
    echo 'One Final Test'; # This is a one-line shell-style comment
?>

# the HTML code after // ... ?> or # ...?> will be printed
#   it behaves the same with // %> and # %>

<h1>This is an <?php # echo 'simple';?> example</h1>
<p>The header above will say 'This is an  example'.</p>

<?php
 # make sure you don't nest C style comments
 /*
    echo 'This is a test'; /* This comment will cause a problem */
 */
?>
