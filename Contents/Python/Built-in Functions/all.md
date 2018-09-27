### all

##### Description

Return True if all elements of the iterable are true (or if the iterable is empty).
Equivalent to:

```python
def all(iterable):
    for element in iterable:
        if not element:
            return False
    return True
```