## Noir FNV Hashing

The goal of this assignment is to learn the basics of Noir by implementing FNV hashing.

FNV (Fowler-Noll-Vo) hashing is a family of non-cryptographic hash functions that are designed to be fast and efficient while producing a relatively good distribution of hash values.

The FNV hash algorithm operates on a byte sequence and produces a hash value. It starts with an initial value, usually a prime number, and then processes each byte of the input data, updating the hash value using a simple multiplication and XOR operation.

The basic implementation of an FNV algorithm in python is given below:

```python
def fnv_hash(data):
    size = 2**32
    hash_value = 0x811C9DC5
    prime = 0x1000193

    for byte in data:
        product = (hash_value * prime) % size
        hash_value = (product ^ byte)

    return hash_value
```

The function when given a value of `0x079A6F9C` returns the hashed value `0x71233de7`. Your goal for this assignment is to implement this in Noir. Use the same values of size, initial value and prime number.

## Evaluation

-   Create a fork of this repo

-   Clone the forked repo. You can use the following command after replacing the `CLONE_URL` with the clone url of your repo

    ```
    git clone CLONE_URL
    ```
    
-   **Go to your forked repo and under Actions make sure that github actions on forked repo are enabled.**
  
-   Make changes to the `src/main.nr` file. Add your hashing logic to `calculate_hash` function. The function should take in a value and return its hash.

-   Run Tests
    ```
    nargo test
    ```

-   Push your changes to `main` branch of your forked repo.

-   Submit your name, email and link to your forked repo [here](https://airtable.com/apppwJwKgRGomJLLY/shrlDlkFR3XZKZRmN).

## Reference

- [Noir Docs](https://noir-lang.org/)
