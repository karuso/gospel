### any

##### Description

Return True if any element of the iterable is true. If the iterable is empty, return False.
Equivalent to:

```python
def any(iterable):
    for element in iterable:
        if element:
            return True
    return False
```