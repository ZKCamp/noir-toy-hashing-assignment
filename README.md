## Issues I ran into

My first commit had a bug, but I figured out that I was calculating the `size` wrong, so I started using the `.pow_32()` method.

However, if I try to test the program using `.pow_32(32)`, I receive this error:

```
[noir_toy_hashing] Testing test_3... The application panicked (crashed).
Message:  attempt to calculate the remainder with a divisor of zero
Location: /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/core/src/num/mod.rs:933

This is a bug. We may have already fixed this in newer versions of Nargo so try searching for similar issues at https://github.com/noir-lang/noir/issues/.
If there isn't an open issue for this bug, consider opening one at https://github.com/noir-lang/noir/issues/new?labels=bug&template=bug_report.yml
```