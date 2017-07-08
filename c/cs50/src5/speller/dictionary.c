/**
 * Implements a dictionary's functionality.
 */

#include "dictionary.h"

// how to implement a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node* next;
}
node;
node* hashtable[HASHTABLE_SIZE];

// global variable for tracking dictionary size
unsigned int word_count = 0;

// global boolean for tracking load/unload dictionary operations
bool loaded = false;

/**
 * Hash function
 */
int hash_it(char* needs_hashing)
{
    unsigned int hash = 0;  // unsigned
    for (int i=0, n=strlen(needs_hashing); i<n; i++)
        hash = (hash << 2) ^ needs_hashing[i];
    return hash % HASHTABLE_SIZE;
}

/**
 * Returns true if word is in dictionary else false.
 */
bool check(const char *word)
{
    // make a new word
    int len = strlen(word);
    char word_copy[len + 1];
    for(int i = 0; i < len; i++)
    {
        word_copy[i] = tolower(word[i]);
    }
    word_copy[len] = '\0';

    // check the word in dictionary
    int bucket = hash_it(word_copy);
    node* cursor = hashtable[bucket];
    while (cursor != NULL)
    {
        if (strcmp(cursor->word, word_copy) == 0)
        {
            return true;
        }
        else
        {
            cursor = cursor->next;
        }
    }
    return false;
}

/**
 * Loads dictionary into memory. Returns true if successful else false.
 */
bool load(const char *dictionary)
{
    for (int i = 0; i < HASHTABLE_SIZE; i++)
    {
        hashtable[i] = NULL;
    }

    // load dictionary file
    FILE* fp = fopen(dictionary, "r");
    if (fp == NULL)
    {
        printf("Could not open dictionary.\n");
        return false;
    }

    // scan dictionary word by word
    while (true)
    {
        node* new_node = malloc(sizeof(node));
        if (new_node == NULL)
        {
            printf("Could not malloc a new node.\n");
            return false;
        }
        fscanf(fp, "%s", new_node->word);
        new_node->next = NULL;
        if (feof(fp))
        {
            free(new_node);
            break;
        }
        word_count++;
        int h = hash_it(new_node->word);
        node* head = hashtable[h];
        if (head == NULL)
        {
            hashtable[h] = new_node;
        }
        else
        {
            new_node->next = hashtable[h];
            hashtable[h] = new_node;
        }
    }
    fclose(fp);
    loaded = true;
    return false;
}

/**
 * Returns number of words in dictionary if loaded else 0 if not yet loaded.
 */
unsigned int size(void)
{
    if (loaded)
    {
        return word_count;
    }
    else
    {
        return 0;
    }
}

/**
 * Unloads dictionary from memory. Returns true if successful else false.
 */
bool unload(void)
{
    for (int i = 0; i < HASHTABLE_SIZE; i++)
    {
        node* cursor = hashtable[i];
        while (cursor != NULL)
        {
            node* temp = cursor;
            cursor = cursor->next;
            free(temp);
        }
    }
    loaded = false;
    return true;
}
