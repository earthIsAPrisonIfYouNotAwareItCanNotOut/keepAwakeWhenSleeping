/**
 * primitive
 *
 */
{
    int x = 12;
    // Only x available
    {
        int q = 96;
        // Both x & q available
    }
    // Only x available
    // q is "out of scope"
}

{
    int x = 12; {
        int x = 96; // Illegal
    }
}

/**
 * object
 *
 */
{
    String s = new String("a string");
} // End of scope
